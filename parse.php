<?php
$keys = [
    'else ',
    'for ',
    'if ',
    'local ',
    'function ',
    'return ',
    'require"',
    'debug.',
    'coroutine.',
];
$excepts = [
    'buff[n]',
];
$lists = json_decode(file_get_contents(__DIR__ . '/lua.json'));


function deleteDirectory($dir)
{
    if (!is_dir($dir)) {
        return false;
    }

    $files = array_diff(scandir($dir), array('.', '..'));
    foreach ($files as $file) {
        $path = $dir . DIRECTORY_SEPARATOR . $file;
        if (is_dir($path)) {
            deleteDirectory($path);
        } else {
            unlink($path);
        }
    }
    return rmdir($dir);
}

$res = [];

foreach ($lists as $v) {
    if (in_array($v->body, $excepts)) {
        continue;
    }
    foreach ($keys as $key) {
        if (str_starts_with($v->body, $key)) {
            continue 2;
        }
    }

    $name = $v->body;
    $name = preg_replace('/\$\{\d+:/', '', $name);
    $name = str_replace('}', '', $name);
    $name = str_replace('[', '', $name);
    $name = str_replace(']', '', $name);


    $begin = explode('(', $name, 2)[0];
    if (str_contains($begin, '.')) {
        [$class] = explode('.', $begin, 2);
    } else if (str_contains($name, ':')) {
        [$class] = explode(':', $begin, 2);
        $class .= ':';
    } else {
        $class = 'globl';
    }

    $description = trim($v->description);
    $description = str_replace("\r", '', $description);
    $description = preg_split("/\n/", $description);
    foreach ($description as &$_v) {
        $_v = "--$_v";
    }
    unset($_v);

    $res[$class][] = implode("\n", [
        ...$description,
        "function {$name} end"
    ]);
}

@deleteDirectory(__DIR__ . "/helpers");
@mkdir(__DIR__ . "/helpers");

foreach ($res as $class => &$functions) {
    $code = implode("\n\n", $functions);

    if ($class !== 'globla') {
        $var = $class;
        if (str_ends_with($var, ':')) {
            $class = substr($class, 0, -1);
            $var = "local $class";
        }
        $code = "$var = {}\n\n$code";
    }

    file_put_contents(__DIR__ . "/helpers/$class.lua", $code);
}
unset($functions);




echo 'done';
