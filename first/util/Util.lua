--
Util = {}

function Util.debug ( t )
	print ( '----------------' )
	print 'Rig contents: '
	for k, v in pairs ( t ) do
		print ( k, v )
	end
	print 'Metatable contents: '
	local mt = getmetatable ( t )
	for k, v in pairs ( mt ) do
		print ( k, v )
	end
	if mt.__index then
		print 'Metatable.__index contents:'
		for k, v in pairs ( mt.__index ) do
			print ( k, v )
		end
	end
	print ( '----------------' )
end

return Util
