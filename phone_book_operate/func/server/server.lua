--[[-------------------readme---------------
ms: moile station  移动终端
暂时不使用“协程”
sl: shunlian
]]--
--下载的脚本放在的地方

-----------------------------------------------------------------------------主程序----------
sl_main_version = "20170503"  --版本号--
sl_ms = {}; --当前手机对象
function init_ms()
	o = {};
	o.base_info = {};
	o.base_info.ms_id   =   get_ms_uuid();
	o.base_info.ms_type =   get_ms_type();
	o.base_info.ms_act  =   g_sl_account;
	o.base_info.ms_pwd  =   g_sl_password;
	
	sl_ms = class_base_ms:new(o);
	--print(sl_ms.current_task_info.ms_stg_id)
	--print(sl_ms.base_info.ms_id )
	return true;
end
--init_ms();

--系统初始化
function init_sys()
	if false == file_exists(sl_fix_path) then  --创建脚本文件夹
          os.execute("mkdir -p " .. sl_fix_path);
    end
	logFileInit(sl_log_file); --初始化log文件
    if true ~= init_ms() then
    	error_info("初始化手机错误！");
    end  
    return true;
end

function sl_main()
	--assert(false, "sdsdiahiuu")
	notifyMessage( "开始执行服务器任务");	--会延迟1s
	mSleep(1200);
	if true ~= init_sys() then
		error_info("初始化错误！");
		mSleep(5000);
        os.exit(1);
	end
	
	local my_result = false
	init_track(); --初始化记录工具
	init_nv();

	while true do 
		--sl_ms
		if true == sl_ms:get_task() then
			sl_ms:run_task();
			mSleep(100);
		else
			error_info("运行脚本错误！");
		end
	end
end

sl_main();

-----------------------------------------接口测试-------------------------
--测试：
--1. 清除手机中的脚本，及一切缓存数据; 
--2. 注释掉上面的sl_main
--3. 设置下面的 account 和 password
--4. 打开下面main函数


-- g_sl_account 	= "kobe";
-- g_sl_password 	= "H11111111h"
-- function main( ... )
-- 	os.execute("rm -rf /private/var/touchelf/scripts/sl"); --1. 清除手机中的脚本，及一切缓存数据;
-- 	sl_main();
-- 	-- body
-- end

-- my_index = 0;
-- function test_nv_track_reset()
-- 	if my_index <= 8 then
-- 		track_write_record_item('index_'..my_index,  my_index);
-- 		nv_write_nv_item('nv_index_'..my_index, my_index);
-- 	else
-- 		reset_ms_server();
-- 		nv_write_nv_item('nv_reset'..my_index, my_index);
-- 		my_index = 0;
-- 	end
-- end