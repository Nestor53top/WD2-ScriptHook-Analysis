-- CDominoManager
CDominoManager._TraceError = CDominoManager._TraceError or CDominoManager.TraceError

function CDominoManager:TraceError(msg)
	print("[CDominoManager:TraceError] "..msg)
	return self:_TraceError(msg)
end