--用来将文件打包 package--

 func_name = "server" --功能的名称 
 __FILE__ = debug.getinfo(1,'S').source:sub(2) --当前的文件全路径

package_file_list = {
  "lib/lib_file_operate.lua",
  "class/class_base_page.lua", 
  "page/page_all_data.lua",    --放在page的第一位                 
  "page/dianhuaben/page_main.lua",              
}

dofile("../../lib/lib_file_operate.lua")  --添加文件操作
root_dir = get_prj_root_dir(__FILE__, 2); --根目录，当前目录往上2级
--current_dir 	= get_current_dir(__FILE__);
dofile(root_dir .. "package/sl_package.lua")  --打包

start_package(func_name, root_dir, package_file_list); 