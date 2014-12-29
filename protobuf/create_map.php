/*
 cd /Applications/Protobuf/compiler/src
 
 /Applications/Protobuf/compiler/src/protoc ./mshops.proto --objc_out=/Users/air/Desktop/test/
 */
<?php
define('DIR_ROOT', dirname(__FILE__));
function _msg($msg, $title = '操作成功'){
    echo "====={$title}=====>\n";
    echo $msg;
    echo "\n";
    echo "====={$title}=====>\n";
}
function _error($msg){
    _msg($msg, '!!!!Error!!!出错啦!!!!');
    exit;
}
$file = $argv[1];
if(!file_exists($file)){
    _error($file.' 文件不存在。使用示例：php create_map.php ./map.ini');
}

$codeMapObjcClientArr = array();
$codeMapObjcServerArr = array();
$codeMapObjcDefineArr = array();
$codeMapPhpArr = array();

$configContent = file_get_contents($file);
$configArr = explode("\n", trim($configContent));
if(empty($configArr)){
    _error($file.' 配置为空');
}

$codePool = array();
$classPool = array();
foreach($configArr as $configItem){
    $configItem = trim($configItem);
    if(!$configItem){
        continue;
    }

    $configItemArr = explode(',', $configItem);
    if(count($configItemArr) < 4){
        _error('配置文件中包含非法配置数据:'.$configItem);
    }

    $controller = trim(array_shift($configItemArr));
    $controllerUpercase = strtoupper($controller);
    $method = trim(array_shift($configItemArr));
    $methodUpercase = strtoupper($method);
    $code = trim(array_shift($configItemArr));
    $className = $controller.$method;


    if(!$controller){
        _error('配置文件中包含空的控制器:'.$code.' => '.$className);
    }

    if(!$method){
        _error('配置文件中包含空的方法名:'.$code.' => '.$className);
    }

    if(isset($codePool[$code])){
        _error('配置文件中包含重复的Code:'.$code.' => '.$codePool[$code].' 和 '.$className);
    }
    if(isset($classPool[$className])){
        _error('配置文件中包含重复的控制器方法:'.$className.' => '.$classPool[$className].' 和 '.$code);
    }

    $codePool[$code] = $className;
    $classPool[$className] = $code;
    $desc = implode(',', $configItemArr);
    $desc = trim(str_replace(array('/', '//'), array('', ''), $desc));

    $codeMapPhpArr[] = "\t\t//{$desc}\n"."\t\t'{$code}' => array('class' => '{$controller}', 'method' => '{$method}')";
    $codeMapObjcClientArr[] = "\t\t\t\t\t @\"PbMc{$controller}{$method}\", @\"{$code}\"";
    $codeMapObjcServerArr[] = "\t\t\t\t\t @\"PbMs{$controller}{$method}\", @\"{$code}\"";
    $codeMapObjcDefineArr[] = "#define PBMAP_{$controllerUpercase}_{$methodUpercase} {$code}//{$desc}";
}

$codeMapPhp = file_get_contents(DIR_ROOT.'/php/map.php.ini');
$codeMapPhp = str_replace('__CODE_DYNAMIC__',  implode(",\n", $codeMapPhpArr), $codeMapPhp);
file_put_contents(DIR_ROOT.'/php/map.php', $codeMapPhp);

$codeMapObjcDictStart = '[[NSDictionary alloc] initWithObjectsAndKeys:';
$codeMapObjcDictEnd = ',nil]';
$codeMapObjcClass = file_get_contents(DIR_ROOT.'/objc/MapPb.m.ini');
$codeMapObjcClass = str_replace('__CODE_DYNAMIC_MAP_CLIENT__',  $codeMapObjcDictStart."\n".implode(",\n", $codeMapObjcClientArr).$codeMapObjcDictEnd, $codeMapObjcClass);
$codeMapObjcClass = str_replace('__CODE_DYNAMIC_MAP_SERVER__',  $codeMapObjcDictStart."\n".implode(",\n", $codeMapObjcServerArr).$codeMapObjcDictEnd, $codeMapObjcClass);
file_put_contents(DIR_ROOT.'/objc/MapPb.m', $codeMapObjcClass);

$codeMapObjcHeader = file_get_contents(DIR_ROOT.'/objc/MapPb.h.ini');
$codeMapObjcHeader = str_replace('__CODE_DYNAMIC_DEFINE__',  implode("\n", $codeMapObjcDefineArr), $codeMapObjcHeader);
file_put_contents(DIR_ROOT.'/objc/MapPb.h', $codeMapObjcHeader);

_msg('文件已成功生成');
/*
 *
 * index
operation
className
 * NSDictionary *dictionary = ［NSDictionary alloc] initWithObjectsAndKeys:
@"number1",@"1",@"number2",@"2",@"number3",@"3",nil];

 * <?php
return array(
	'ACTION_CODE_MAP' => array(
		'1001' => array('class' => 'User', 'method' => 'Login'),
	),
);
?>

 */