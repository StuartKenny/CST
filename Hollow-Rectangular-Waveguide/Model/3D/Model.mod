'# MWS Version: Version 2019.0 - Sep 20 2018 - ACIS 28.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 8 fmax = 15
'# created = '[VERSION]2015.0|24.0.2|20141205[/VERSION]


'@ use template: Waveguides - Retangular Waveguide

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With
'----------------------------------------------------------------------------
' History:
' jei, vso 18-Jan-2012: ver1
' boundaries
With Boundary
     .Xmin "electric"
     .Xmax "electric"
     .Ymin "electric"
     .Ymax "electric"
     .Zmin "electric"
     .Zmax "electric"
End With
With Mesh
     .MeshType "PBA"
     .SetCreator "High Frequency"
     .AutomeshRefineAtPecLines "True", "2"
     .UseRatioLimit "True"
     .RatioLimit "10"
     .LinesPerWavelength "20"
     .MinimumStepNumber "10"
     .Automesh "True"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "StepsPerWaveNear", "13"
End With
' solver - FD settings
With FDSolver
     .Reset
     .Method "Tetrahedral Mesh" ' i.e. general purpose
     .AccuracyHex "1e-6"
     .AccuracyTet "1e-5"
     .AccuracySrf "1e-3"
     .SetUseFastResonantForSweepTet "False"
     .Type "Direct"
     .MeshAdaptionHex "False"
     .MeshAdaptionTet "True"
     .InterpolationSamples "5001"
End With
With MeshAdaption3D
    .SetType "HighFrequencyTet"
    .SetAdaptionStrategy "Energy"
    .MinPasses "3"
    .MaxPasses "20"
    .MaxDeltaS "0.005"
End With
With FDSolver
     .Method "Tetrahedral Mesh (MOR)"
     .HexMORSettings "", "5001"
End With
FDSolver.Method "Tetrahedral Mesh" ' i.e. general purpose
'----------------------------------------------------------------------------
'set the frequency range
Solver.FrequencyRange "8", "15"
Dim sDefineAt As String
sDefineAt = "10; 13.5; 15"
Dim sDefineAtName As String
sDefineAtName = "10; 13.5; 15"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")
Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)
Dim zz_val As String
zz_val = aFreq (nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames (nIndex)
' Define E-Field Monitors
With Monitor
    .Reset
    .Name "e-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency zz_val
    .Create
End With
' Define H-Field Monitors
With Monitor
    .Reset
    .Name "h-field ("& zz_name &")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency zz_val
    .Create
End With
Next
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Tet"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "Tetrahedral"
End With
'set the solver type
ChangeSolverType("HF Frequency Domain")

'@ new component: component1

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
Component.New "component1"

'@ define brick: component1:solid1

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "a" 
     .Yrange "0", "b" 
     .Zrange "0", "l" 
     .Create
End With

'@ pick face

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
Pick.PickFaceFromId "component1:solid1", "2"

'@ define port: 1

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "0", "22.86" 
     .Yrange "0", "10.16" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ pick face

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
Pick.PickFaceFromId "component1:solid1", "1"

'@ define port: 2

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "0", "22.86" 
     .Yrange "0", "10.16" 
     .Zrange "40", "40" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ switch working plane

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
Plot.DrawWorkplane "false"

'@ pick edge

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
Pick.PickEdgeFromId "component1:solid1", "9", "4"

'@ define distance dimension by picks

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
With Dimension
    .Reset
    .UsePicks True
    .SetType "Distance"
    .SetID "0"
    .SetOrientation "Smart Mode"
    .SetDistance "3.540694"
    .SetViewVector "0.619615", "-0.383614", "0.684776"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
Pick.PickEdgeFromId "component1:solid1", "6", "6"

'@ define distance dimension by picks

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
With Dimension
    .Reset
    .UsePicks True
    .SetType "Distance"
    .SetID "1"
    .SetOrientation "Smart Mode"
    .SetDistance "3.491198"
    .SetViewVector "0.619615", "-0.383614", "0.684776"
    .Create
End With
Pick.ClearAllPicks

'@ pick edge

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
Pick.PickEdgeFromId "component1:solid1", "5", "5"

'@ define distance dimension by picks

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
With Dimension
    .Reset
    .UsePicks True
    .SetType "Distance"
    .SetID "2"
    .SetOrientation "Smart Mode"
    .SetDistance "2.342361"
    .SetViewVector "0.619615", "-0.383614", "0.684776"
    .Create
End With
Pick.ClearAllPicks

'@ change solver type

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
ChangeSolverType "HF Time Domain"

'@ define boundaries

'[VERSION]2015.0|24.0.2|20141205[/VERSION]
With Boundary
     .Xmin "electric" 
     .Xmax "electric" 
     .Ymin "electric" 
     .Ymax "electric" 
     .Zmin "electric" 
     .Zmax "electric" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "none" 
     .YsymmetryThermal "none" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "False" 
     .ApplyInAllDirectionsThermal "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With

'@ define time domain solver parameters

'[VERSION]2015.3|24.0.2|20150501[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-50"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

