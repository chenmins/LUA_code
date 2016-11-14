--logger.lua
--logger����֧��
require "base.class"

LOG_LEVEL = {
	OFF = 100,	-- �ر�������Ϣ���
	ALL = 0,	-- �������еȼ���Ϣ���
	INFO = 1,	-- ���ڸ��ٳ������н���
	DEBUG = 2,	-- ���ڵ�����Ϣ�����
	WARN = 3,	-- ��������ʱ�����쳣
	ERROR = 4,	-- ��������ʱ������Ԥ�ϵĴ���,��ʱͨ��������,�����ó���ָ���������
}

Logger = own_class(nil, Singleton)
function Logger:__init()
	self.level = LOG_LEVEL.INFO
end

--�ر�logger
function Logger:disable()
	self.level = LOG_LEVEL.OFF
end

--����logger�ȼ�
function Logger:setLevel(lvl)
	if table.contains(LOG_LEVEL, lvl) then
		self.level = lvl
	end	
end

--INFO
function Logger:info(fmt, ...)
	if self.level <= LOG_LEVEL.INFO then
		fmt = string.format("[INFO]: %s", fmt)
		print(string.format(fmt, ...))
	end
end

--DEBUG
function Logger:debug(fmt, ...)
	if self.level <= LOG_LEVEL.DEBUG then
		fmt = string.format("[DEBUG]: %s", fmt)
		print(string.format(fmt, ...))
	end
end

--WARN
function Logger:warn(fmt, ...)
	if self.level <= LOG_LEVEL.WARN then
		fmt = string.format("[WARNING]: %s", fmt)
		print(string.format(fmt, ...))
	end
end

--ERROR
function Logger:error(fmt, ...)
	if self.level <= LOG_LEVEL.ERROR then
		fmt = string.format("[ERROR]: %s", fmt)
		print(string.format(fmt, ...))
	end
end

function Logger.getInstance()
	return Logger()
end

g_logger = Logger.getInstance()
