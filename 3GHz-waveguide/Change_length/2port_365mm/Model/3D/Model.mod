'# MWS Version: Version 2019.7 - Jul 05 2019 - ACIS 28.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 1 fmax = 4


'@ use template: Waveguide Coupler

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
' Template for Waveguide Coupler
' ==============================
' (CSTxMWSxONLY)
' set units to mm, ghz
With Units 
     .Geometry "mm" 
     .Frequency "ghz" 
     .Time "ns" 
End With 
' set background material to pec
With Background 
     .Type "pec" 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
End With 
' set boundary conditions to electric
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
End With

'@ define brick: Vacuum:solid1

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Layer "Vacuum" 
     .Xrange "0", "22.86" 
     .Yrange "0", "10.16" 
     .Zrange "0", "25" 
     .Create
End With

'@ define layer colour: Vacuum

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Layer 
     .Name "Vacuum" 
     .Colour "0.5", "0.8", "1" 
     .Wireframe "False" 
     .Transparency "25" 
     .ChangeColour 
End With

'@ pick face

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Vacuum:solid1", "5"

'@ align wcs with face

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.AlignWCSWithSelectedFace 
Pick.PickCenterpointFromId "Vacuum:solid1", "5" 
WCS.AlignWCSWithSelectedPoint

'@ pick mid point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.PickMidpointFromId "Vacuum:solid1", "8"

'@ align wcs with point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.AlignWCSWithSelectedPoint

'@ move wcs

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.MoveWCS "local", "0.0", "-(3.835+(4.115/2))", "0.0"

'@ define layer: Coax

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Layer
     .Reset 
     .Name "Coax"
     .FrqType "hf" 
     .Type "Normal" 
     .Epsilon "1.9873" 
     .Mue "1.0" 
     .Kappa "0.0" 
     .TanD "0.0" 
     .TanDFreq "0.0" 
     .TanDGiven "False" 
     .TanDModel "ConstTanD" 
     .KappaM "0.0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .DispModelEps "None" 
     .DispModelMue "None" 
     .Rho "0.0" 
     .Colour "0", "0.501961", "0" 
     .Wireframe "False" 
     .Transparency "0" 
     .Create
End With

'@ define cylinder: Coax:coax

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "coax" 
     .Component "Coax" 
     .Material "Coax" 
     .OuterRadius "(4.115/2)" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-3.25", "4" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: Vacuum:solid1, Coax:coax

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Solid.Insert "Vacuum:solid1", "Coax:coax"

'@ pick center point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.PickCenterpointFromId "Coax:coax", "3"

'@ align wcs with point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.AlignWCSWithSelectedPoint

'@ store picked point: 1

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.NextPickToDatabase "1" 
Pick.PickCenterpointFromId "Coax:coax", "1"

'@ define cylinder: PEC:solid3

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid3" 
     .Layer "PEC" 
     .OuterRadius "1.27/2" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "zp(1)", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Create 
End With

'@ pick center point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.PickCenterpointFromId "PEC:solid3", "1"

'@ align wcs with point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.AlignWCSWithSelectedPoint

'@ define cylinder: PEC:solid4

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid4" 
     .Layer "PEC" 
     .OuterRadius "1.4" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-2.1", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Create 
End With

'@ boolean add shapes: PEC:solid3, PEC:solid4

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Solid.Add "PEC:solid3", "PEC:solid4"

'@ pick circle center point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.PickCirclecenterFromId "Vacuum:solid1", "15"

'@ align wcs with point

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.AlignWCSWithSelectedPoint

'@ move wcs

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.MoveWCS "local", "0.0", "-((4.115/2)+0.15+0.9)", "-10.16"

'@ define cylinder: PEC:stub1

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "stub1" 
     .Layer "PEC" 
     .OuterRadius "0.9" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "0", "1.7+1.2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Create 
End With

'@ move wcs

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.MoveWCS "local", "0.0", "-4.35-2*0.9", "0.0"

'@ define cylinder: PEC:stub2

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "stub2" 
     .Layer "PEC" 
     .OuterRadius "0.9" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "0", "1.2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Create 
End With

'@ define automesh state

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Mesh.Automesh "True"

'@ define frequency range

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Solver.FrequencyRange "8.5", "12.5"

'@ pick face

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Coax:coax", "3"

'@ define port: 1

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .NumberOfModes "1" 
     .AdjustPolarization False 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Location "ymax" 
     .Xrange "9.3725", "13.4875" 
     .Zrange "3.835", "7.95" 
     .Create 
End With

'@ pick face

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Vacuum:solid1", "4"

'@ define port: 2

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .NumberOfModes "1" 
     .AdjustPolarization False 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Location "zmax" 
     .Xrange "0", "22.86" 
     .Yrange "0", "10.16" 
     .Create 
End With

'@ set mesh properties

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "10.0" 
     .LinesPerWavelength "20" 
     .MinimumLineNumber "10" 
     .Automesh "True" 
End With

'@ define automesh parameters

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Mesh 
     .AutomeshStraightLines "True" 
     .AutomeshEllipticalLines "True" 
     .AutomeshRefineAtPecLines "True", "5" 
     .AutomeshRefinePecAlongAxesOnly "False" 
     .AutomeshAtEllipseBounds "True", "10" 
     .AutomeshAtWireEndPoints "True" 
     .AutomeshAtProbePoints "True" 
     .AutomeshRefineDielectrics "True" 
     .MergeThinPECLayerFixpoints "True" 
     .EquilibrateMesh "False" 
     .UsePecEdgeModel "True" 
     .MeshType "PBA" 
     .AutoMeshLimitShapeFaces "True" 
     .AutoMeshNumberOfShapeFaces "1000" 
End With 
With Solver 
     .UseSplitComponents "True" 
     .PBAFillLimit "99" 
End With

'@ define solver parameters

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-60" 
     .MeshAdaption "False" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseNetworkComputing "False" 
End With

'@ define special solver parameters

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Solver 
     .TimeBetweenUpdates "1200" 
     .NumberOfPulseWidths "20" 
     .EnergyBalanceLimit "0.03" 
     .UseArfilter "False" 
     .ArMaxEnergyDeviation "0.1" 
     .ArPulseSkip "1" 
     .WaveguideBroadband "False" 
     .SetBBPSamples "5" 
     .SetSamplesFullDeembedding "20" 
     .MatrixDump "False" 
     .TimestepReduction "0.45" 
     .NumberOfSubcycles "4" 
     .SubcycleFillLimit "70" 
     .UseParallelization "True" 
     .MaximumNumberOfProcessors "2" 
     .TimeStepStabilityFactor "1.0" 
     .UseOpenBoundaryForHigherModes "True" 
     .SetModeFreqFactor "0.5" 
     .SurfaceImpedanceOrder "10" 
     .SetPortShielding "False" 
     .SetTimeStepMethod "Automatic" 
     .FrequencySamples "1001" 
     .ConsiderTwoPortReciprocity "True" 
     .UseTSTAtPort "True" 
     .SubGridTimeCycling "True" 
     .SParaAdjustment "True" 
     .RestartAfterInstabilityAbort "True" 
     .HardwareAcceleration "False" 
End With

'@ define solver parameters

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "1" 
     .StimulationMode "1" 
     .SteadyStateLimit "-60" 
     .MeshAdaption "False" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
End With

'@ set units in materials

'[VERSION]2011.0|21.0.0|20100803[/VERSION]
Material.SetUnitInMaterial "Coax", "GHz", "mm"

'@ set mesh properties

'[VERSION]2013.0|23.0.0|20130115[/VERSION]
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "CellsPerWavelengthPolicy", "cellsperwavelength" 
     .Set "CurvatureOrderPolicy", "off" 
     .SetMeshType "Plane" 
     .Set "CurvatureOrderPolicy", "off" 
End With

'@ change solver type

'[VERSION]2013.0|23.0.0|20130115[/VERSION]
ChangeSolverType "HF Time Domain"

'@ set mesh properties (Hexahedral)

'[VERSION]2014.0|23.0.0|20130901[/VERSION]
With Mesh 
     .MeshType "PBA" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "20" 
     .Set "StepsPerWaveFar", "20" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "MaxStepNear", "0" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "GeometryRefinementSameAsNear", "0" 
     'MIN CELL 
     .Set "UseRatioLimitGeometry", "1" 
     .Set "RatioLimitGeometry", "10" 
     .Set "MinStepGeometryX", "0" 
     .Set "MinStepGeometryY", "0" 
     .Set "MinStepGeometryZ", "0" 
     .Set "UseSameMinStepGeometryXYZ", "1" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "FaceRefinementOn", "0" 
     .Set "FaceRefinementPolicy", "2" 
     .Set "FaceRefinementRatio", "2" 
     .Set "FaceRefinementStep", "0" 
     .Set "FaceRefinementNSteps", "2" 
     .Set "EllipseRefinementOn", "0" 
     .Set "EllipseRefinementPolicy", "2" 
     .Set "EllipseRefinementRatio", "2" 
     .Set "EllipseRefinementStep", "0" 
     .Set "EllipseRefinementNSteps", "2" 
     .Set "FaceRefinementBufferLines", "3" 
     .Set "EdgeRefinementOn", "1" 
     .Set "EdgeRefinementPolicy", "1" 
     .Set "EdgeRefinementRatio", "5" 
     .Set "EdgeRefinementStep", "0" 
     .Set "EdgeRefinementBufferLines", "3" 
     .Set "RefineEdgeMaterialGlobal", "0" 
     .Set "RefineAxialEdgeGlobal", "0" 
     .Set "BufferLinesNear", "3" 
     .Set "UseDielectrics", "1" 
     .Set "EquilibrateOn", "0" 
     .Set "Equilibrate", "1.5" 
     .Set "IgnoreThinPanelMaterial", "0" 
     .Set "RefineEdgesAtBoundary", "0" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With 
With Discretizer 
     .MeshType "PBA" 
     .PBAType "Fast PBA" 
     .AutomaticPBAType "True" 
     .FPBAAccuracyEnhancement "enable"
     .ConnectivityCheck "False"
     .ConvertGeometryDataAfterMeshing "True" 
     .UsePecEdgeModel "True" 
     .GapDetection "False" 
     .FPBAGapTolerance "1e-3" 
     .SetMaxParallelMesherThreads "Hex", "8"
     .SetParallelMesherMode "Hex", "Maximum"
     .PointAccEnhancement "0" 
     .UseSplitComponents "True" 
     .EnableSubgridding "False" 
     .PBAFillLimit "99" 
     .AlwaysExcludePec "False" 
End With

'@ define time domain solver parameters

'[VERSION]2014.0|23.0.0|20130901[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "1"
     .StimulationMode "1"
     .SteadyStateLimit "-60"
     .MeshAdaption "False"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set pba mesh type

'[VERSION]2014.0|23.0.0|20130901[/VERSION]
Mesh.MeshType "PBA"

'@ set mesh properties (for backward compatibility)

'[VERSION]2018.0|27.0.2|20170822[/VERSION]
With MeshSettings 
    .SetMeshType "Hex"
    .Set "PlaneMergeVersion", 0
End With

'@ define special time domain solver parameters

'[VERSION]2018.0|27.0.2|20170822[/VERSION]
'STEADY STATE
With Solver
     .SteadyStateDurationType "Number of pulses"
     .NumberOfPulseWidths "20"
     .SteadyStateDurationTime "1.66667"
     .SteadyStateDurationTimeAsDistance "500"
     .StopCriteriaShowExcitation "False"
     .RemoveAllStopCriteria
     .AddStopCriterion "All S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "Reflection S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "All Probes", "0.004", "1", "False"
     .AddStopCriterion "All Radiated Powers", "0.004", "1", "False"
End With
'GENERAL
With Solver
     .TimeStepStabilityFactor "1.0"
     .RestartAfterInstabilityAbort "True"
     .AutomaticTimeSignalSampling "True"
     .SuppressTimeSignalStorage "False"
     .ConsiderExcitationForFreqSamplingRate "False"
     .UseBroadBandPhaseShift "False"
     .SetBroadBandPhaseShiftLowerBoundFac "0.1"
     .SetPortShieldingType "NONE"
     .FrequencySamples "1001"
     .FrequencyLogSamples "0"
     .ConsiderTwoPortReciprocity "True"
     .EnergyBalanceLimit "0.03"
     .TDRComputation "False"
     .TDRShift50Percent "False"
     .AutoDetectIdenticalPorts "False"
End With
'HEXAHEDRAL
With Solver
     .SetPMLType "CONVPML"
     .UseVariablePMLLayerSizeStandard "False"
     .KeepPMLDepthDuringMeshAdaptationWithVariablePMLLayerSize "False"
     .SetSubcycleState "Automatic"
     .NormalizeToReferenceSignal "True"
     .SetEnhancedPMLStabilization "Automatic"
     .SimplifiedPBAMethod "False"
     .SParaAdjustment "True"
     .PrepareFarfields "True"
     .MonitorFarFieldsNearToModel "False"
     .DiscreteItemUpdate "Distributed"
End With
'MATERIAL
With Solver
     .SurfaceImpedanceOrder "10"
     .ActivatePowerLoss1DMonitor "True"
     .PowerLoss1DMonitorPerSolid "False"
     .Use3DFieldMonitorForPowerLoss1DMonitor "True"
     .UseFarFieldMonitorForPowerLoss1DMonitor "False"
     .UseExtraFreqForPowerLoss1DMonitor "False"
     .ResetPowerLoss1DMonitorExtraFreq
     .SetDispNonLinearMaterialMonitor "False"
     .ActivateDispNonLinearMaterialMonitor "0.0",  "0.02",  "0.0",  "False"
     .SetTimePowerLossSIMaterialMonitor "False"
     .ActivateTimePowerLossSIMaterialMonitor "0.0",  "0.02",  "0.0",  "False"
     .SetTimePowerLossSIMaterialMonitorAverage "False"
     .SetTimePowerLossSIMaterialMonitorAverageRepPeriod "0.0"
     .TimePowerLossSIMaterialMonitorPerSolid "False"
     .ActivateSpaceMaterial3DMonitor "False"
     .Use3DFieldMonitorForSpaceMaterial3DMonitor "True"
     .UseExtraFreqForSpaceMaterial3DMonitor "False"
     .ResetSpaceMaterial3DMonitorExtraFreq
     .SetHFTDDispUpdateScheme "Standard"
End With
'AR-FILTER
With Solver
     .UseArfilter "False"
     .ArMaxEnergyDeviation "0.1"
     .ArPulseSkip "1"
End With
'WAVEGUIDE
With Solver
     .WaveguidePortGeneralized "True"
     .WaveguidePortModeTracking "False"
     .WaveguidePortROM "False"
     .DispEpsFullDeembedding "False"
     .SetSamplesFullDeembedding "20"
     .AbsorbUnconsideredModeFields "Automatic"
     .SetModeFreqFactor "0.5"
     .AdaptivePortMeshing "True"
     .AccuracyAdaptivePortMeshing "1"
     .PassesAdaptivePortMeshing "4"
End With
'HEXAHEDRAL TLM
With Solver
     .AnisotropicSheetSurfaceType "0"
     .UseMeshType "1"
     .UseAbsorbingBoundary "True"
     .UseDoublePrecision "False"
     .AllowMaterialOverlap "True"
     .ExcitePlanewaveNearModel "False"
     .SetGroundPlane "False"
     .GroundPlane "x", "0.0"
     .NumberOfLayers "5"
     .HealCheckAllObjects "False"
     .NormalizeToGaussian "True"
     .TimeSignalSamplingFactor "1"
End With
'TLM POSTPROCESSING
With Solver
     .ResetSettings
     .CalculateNearFieldOnCylindricalSurfaces "false", "Coarse" 
     .CylinderGridCustomStep "1" 
     .CalculateNearFieldOnCircularCuts "false" 
     .CylinderBaseCenter "0", "0", "0" 
     .CylinderRadius "3" 
     .CylinderHeight "3" 
     .CylinderSpacing "1" 
     .CylinderResolution "2.0" 
     .CylinderAllPolarization "true" 
     .CylinderRadialAngularVerticalComponents "false" 
     .CylinderMagnitudeOfTangentialConponent "false" 
     .CylinderVm "true" 
     .CylinderDBVm "false" 
     .CylinderDBUVm "false" 
     .CylinderAndFrontAxes "+y", "+z" 
     .ApplyLinearPrediction "false" 
     .Windowing "None" 
     .LogScaleFrequency "false" 
     .AutoFreqStep "true", "1"
     .SetExcitationSignal "" 
     .SaveSettings
End With

'@ set mesh properties (Hexahedral)

'[VERSION]2019.0|28.0.2|20180819[/VERSION]
With Mesh 
     .MeshType "PBA" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "20" 
     .Set "StepsPerWaveFar", "20" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "MaxStepNear", "0" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "GeometryRefinementSameAsNear", "0" 
     'MIN CELL 
     .Set "UseRatioLimitGeometry", "1" 
     .Set "RatioLimitGeometry", "10" 
     .Set "MinStepGeometryX", "0" 
     .Set "MinStepGeometryY", "0" 
     .Set "MinStepGeometryZ", "0" 
     .Set "UseSameMinStepGeometryXYZ", "1" 
End With 
With MeshSettings 
     .Set "PlaneMergeVersion", "2" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "FaceRefinementOn", "0" 
     .Set "FaceRefinementPolicy", "2" 
     .Set "FaceRefinementRatio", "2" 
     .Set "FaceRefinementStep", "0" 
     .Set "FaceRefinementNSteps", "2" 
     .Set "EllipseRefinementOn", "0" 
     .Set "EllipseRefinementPolicy", "2" 
     .Set "EllipseRefinementRatio", "2" 
     .Set "EllipseRefinementStep", "0" 
     .Set "EllipseRefinementNSteps", "2" 
     .Set "FaceRefinementBufferLines", "3" 
     .Set "EdgeRefinementOn", "1" 
     .Set "EdgeRefinementPolicy", "1" 
     .Set "EdgeRefinementRatio", "5" 
     .Set "EdgeRefinementStep", "0" 
     .Set "EdgeRefinementBufferLines", "3" 
     .Set "RefineEdgeMaterialGlobal", "0" 
     .Set "RefineAxialEdgeGlobal", "0" 
     .Set "BufferLinesNear", "3" 
     .Set "UseDielectrics", "1" 
     .Set "EquilibrateOn", "0" 
     .Set "Equilibrate", "1.5" 
     .Set "IgnoreThinPanelMaterial", "0" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With 
With Discretizer 
     .ConnectivityCheck "True"
     .UsePecEdgeModel "True" 
     .GapDetection "True" 
     .FPBAGapTolerance "1e-3" 
     .PointAccEnhancement "0" 
     .TSTVersion "2"
	  .PBAVersion "2018081919" 
End With

'@ set solver type

'[VERSION]2019.0|28.0.2|20180912[/VERSION]
SetSolverType "HF_TRANSIENT"

'@ define material: Aluminum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material
     .Reset
     .Name "Aluminum"
     .Folder ""
.FrqType "static"
.Type "Normal"
.SetMaterialUnit "Hz", "mm"
.Epsilon "1"
.Mu "1.0"
.Kappa "3.56e+007"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstTanD"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "General 1st"
.DispersiveFittingSchemeMu "General 1st"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.FrqType "all"
.Type "Lossy metal"
.MaterialUnit "Frequency", "GHz"
.MaterialUnit "Geometry", "mm"
.MaterialUnit "Time", "s"
.MaterialUnit "Temperature", "Kelvin"
.Mu "1.0"
.Sigma "3.56e+007"
.Rho "2700.0"
.ThermalType "Normal"
.ThermalConductivity "237.0"
.HeatCapacity "0.9"
.MetabolicRate "0"
.BloodFlow "0"
.VoxelConvection "0"
.MechanicsType "Isotropic"
.YoungsModulus "69"
.PoissonsRatio "0.33"
.ThermalExpansionRate "23"
.ReferenceCoordSystem "Global"
.CoordSystemType "Cartesian"
.NLAnisotropy "False"
.NLAStackingFactor "1"
.NLADirectionX "1"
.NLADirectionY "0"
.NLADirectionZ "0"
.Colour "1", "1", "0"
.Wireframe "False"
.Reflection "False"
.Allowoutline "True"
.Transparentoutline "False"
.Transparency "0"
.Create
End With

'@ new component: Waveguide

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.New "Waveguide"

'@ define brick: Waveguide:Waveguide

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Waveguide" 
     .Component "Waveguide" 
     .Material "Aluminum" 
     .Xrange "-wg_wall", "wg_l+wg_wall" 
     .Yrange "-(wg_w/2+wg_wall)", "(wg_w/2+wg_wall)" 
     .Zrange "-(wg_h/2+wg_wall)", "(wg_h/2+wg_wall)" 
     .Create
End With

'@ rename component: Vacuum to: Old_Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Rename "Vacuum", "Old_Vacuum"

'@ paste structure data: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With SAT 
     .Reset 
     .FileName "*1.cby" 
     .SubProjectScaleFactor "0.001" 
     .SubProjectLocalWCS "11.43", "0", "15.15", "-0", "1", "-0", "1", "0", "0" 
     .ImportToActiveCoordinateSystem "True" 
     .ScaleToUnit "True" 
     .Curves "False" 
     .Read 
End With

'@ rename component: Waveguide/Waveguide to: Waveguide/Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Rename "Waveguide/Waveguide", "Waveguide/Vacuum"

'@ rename component: Waveguide/Vacuum to: Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Rename "Waveguide/Vacuum", "Vacuum"

'@ delete component: Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Delete "Vacuum"

'@ rename component: Coax to: Old Coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Rename "Coax", "Old Coax"

'@ new component: Probe1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.New "Probe1"

'@ define cylinder: Probe1:coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Cylinder 
     .Reset 
     .Name "coax" 
     .Component "Probe1" 
     .Material "Aluminum" 
     .OuterRadius "coax_r" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "wg_h/2", "25" 
     .Xcenter "ant_wall_l_tx" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ rename component: PEC to: oldPEC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Rename "PEC", "oldPEC"

'@ define cylinder: Probe1:PEC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Cylinder 
     .Reset 
     .Name "PEC" 
     .Component "Probe1" 
     .Material "PEC" 
     .OuterRadius "1.27/2" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "wg_h/2", "100" 
     .Xcenter "ant_wall_l_tx" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: Waveguide:Waveguide, Probe1:PEC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Waveguide:Waveguide", "Probe1:PEC"

'@ boolean insert shapes: Probe1:coax, Probe1:PEC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Probe1:coax", "Probe1:PEC"

'@ define cylinder: Probe1:conductor

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Cylinder 
     .Reset 
     .Name "conductor" 
     .Component "Probe1" 
     .Material "Aluminum" 
     .OuterRadius "ant_r" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "wg_h/2-ant_l_tx", "25" 
     .Xcenter "ant_wall_l_tx" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ new component: Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.New "Vacuum"

'@ define brick: Vacuum:Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Brick
     .Reset 
     .Name "Vacuum" 
     .Component "Vacuum" 
     .Material "Vacuum" 
     .Xrange "0", "wg_l" 
     .Yrange "-wg_w/2", "wg_w/2" 
     .Zrange "-wg_h/2", "wg_h/2" 
     .Create
End With

'@ boolean insert shapes: Vacuum:Vacuum, Probe1:conductor

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Vacuum:Vacuum", "Probe1:conductor"

'@ boolean insert shapes: Waveguide:Waveguide, Vacuum:Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Waveguide:Waveguide", "Vacuum:Vacuum"

'@ delete component: oldPEC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Delete "oldPEC"

'@ delete component: Old Coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Delete "Old Coax"

'@ delete component: Old_Vacuum

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.Delete "Old_Vacuum"

'@ define material: Copper (pure)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Material
     .Reset
     .Name "Copper (pure)"
     .Folder ""
.FrqType "all"
.Type "Lossy metal"
.MaterialUnit "Frequency", "GHz"
.MaterialUnit "Geometry", "mm"
.MaterialUnit "Time", "s"
.MaterialUnit "Temperature", "Kelvin"
.Mu "1.0"
.Sigma "5.96e+007"
.Rho "8930.0"
.ThermalType "Normal"
.ThermalConductivity "401.0"
.HeatCapacity "0.39"
.MetabolicRate "0"
.BloodFlow "0"
.VoxelConvection "0"
.MechanicsType "Isotropic"
.YoungsModulus "120"
.PoissonsRatio "0.33"
.ThermalExpansionRate "17"
.ReferenceCoordSystem "Global"
.CoordSystemType "Cartesian"
.NLAnisotropy "False"
.NLAStackingFactor "1"
.NLADirectionX "1"
.NLADirectionY "0"
.NLADirectionZ "0"
.FrqType "static"
.Type "Normal"
.SetMaterialUnit "Hz", "mm"
.Epsilon "1"
.Mu "1.0"
.Kappa "5.96e+007"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstTanD"
.DispModelEps "None"
.DispModelMu "None"
.DispersiveFittingSchemeEps "Nth Order"
.DispersiveFittingSchemeMu "Nth Order"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMu "False"
.Colour "1", "1", "0"
.Wireframe "False"
.Reflection "False"
.Allowoutline "True"
.Transparentoutline "False"
.Transparency "0"
.Create
End With

'@ change material: Probe1:conductor to: Copper (pure)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.ChangeMaterial "Probe1:conductor", "Copper (pure)"

'@ change material: Probe1:coax to: Copper (pure)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.ChangeMaterial "Probe1:coax", "Copper (pure)"

'@ rename block: Probe1:coax to: Probe1:coax_shield

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Rename "Probe1:coax", "coax_shield"

'@ delete shape: Probe1:PEC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Delete "Probe1:PEC"

'@ rename block: Probe1:coax_shield to: Probe1:coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Rename "Probe1:coax_shield", "coax"

'@ change material: Probe1:coax to: Coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.ChangeMaterial "Probe1:coax", "Coax"

'@ delete material: PEC

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Material.Delete "PEC"

'@ modify port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Free" 
     .Orientation "ymax" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "ant_wall_l_tx", "ant_wall_l_tx+10" 
     .Yrange "100", "100" 
     .Zrange "100", "105" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Free" 
     .Orientation "ymax" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "ant_wall_l_tx-coax_r/2", "ant_wall_l_tx+coax_r/2" 
     .Yrange "100", "100" 
     .Zrange "-coax_r/2", "coax_r/2" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 2

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "2" 
     .Label "field in cavity" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Free" 
     .Orientation "xmax" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "250", "250" 
     .Yrange "-wg_h/2", "wg_h/2" 
     .Zrange "-wg_w/2", "wg_w/2" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "input" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Free" 
     .Orientation "ymax" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "ant_wall_l_tx-coax_r/2", "ant_wall_l_tx+coax_r/2" 
     .Yrange "100", "100" 
     .Zrange "-coax_r/2", "coax_r/2" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "input" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "1" 
     .Coordinates "Free" 
     .Orientation "ymax" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "ant_wall_l_tx-(coax_r/2)", "ant_wall_l_tx+(coax_r/2)" 
     .Yrange "100", "100" 
     .Zrange "-coax_r/2", "coax_r/2" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ set wcs properties

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With WCS
     .SetNormal "-0", "1", "-0"
     .SetOrigin "0", "0", "0"
     .SetUVector "1", "0", "0"
End With

'@ activate global coordinates

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
WCS.ActivateWCS "global"

'@ activate local coordinates

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
WCS.ActivateWCS "local"

'@ activate global coordinates

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
WCS.ActivateWCS "global"

'@ activate local coordinates

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
WCS.ActivateWCS "local"

'@ set wcs properties

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With WCS
     .SetNormal "-0", "1", "-0"
     .SetOrigin "0", "0", "0"
     .SetUVector "1", "0", "0"
End With

'@ align wcs with global coordinates

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
WCS.AlignWCSWithGlobalCoordinates

'@ clear picks

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.ClearAllPicks

'@ set mesh properties (Hexahedral)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Mesh 
     .MeshType "PBA" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "8" 
     .Set "StepsPerWaveFar", "4" 
     .Set "WavelengthRefinementSameAsNear", "0" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "MaxStepNear", "0" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "GeometryRefinementSameAsNear", "0" 
     'MIN CELL 
     .Set "UseRatioLimitGeometry", "1" 
     .Set "RatioLimitGeometry", "10" 
     .Set "MinStepGeometryX", "0" 
     .Set "MinStepGeometryY", "0" 
     .Set "MinStepGeometryZ", "0" 
     .Set "UseSameMinStepGeometryXYZ", "1" 
End With 
With MeshSettings 
     .Set "PlaneMergeVersion", "2" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "FaceRefinementOn", "0" 
     .Set "FaceRefinementPolicy", "2" 
     .Set "FaceRefinementRatio", "2" 
     .Set "FaceRefinementStep", "0" 
     .Set "FaceRefinementNSteps", "2" 
     .Set "EllipseRefinementOn", "0" 
     .Set "EllipseRefinementPolicy", "2" 
     .Set "EllipseRefinementRatio", "2" 
     .Set "EllipseRefinementStep", "0" 
     .Set "EllipseRefinementNSteps", "2" 
     .Set "FaceRefinementBufferLines", "3" 
     .Set "EdgeRefinementOn", "1" 
     .Set "EdgeRefinementPolicy", "1" 
     .Set "EdgeRefinementRatio", "5" 
     .Set "EdgeRefinementStep", "0" 
     .Set "EdgeRefinementBufferLines", "3" 
     .Set "RefineEdgeMaterialGlobal", "0" 
     .Set "RefineAxialEdgeGlobal", "0" 
     .Set "BufferLinesNear", "3" 
     .Set "UseDielectrics", "1" 
     .Set "EquilibrateOn", "0" 
     .Set "Equilibrate", "1.5" 
     .Set "IgnoreThinPanelMaterial", "0" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With 
With Discretizer 
     .ConnectivityCheck "True"
     .UsePecEdgeModel "True" 
     .GapDetection "True" 
     .FPBAGapTolerance "1e-3" 
     .PointAccEnhancement "0" 
     .TSTVersion "2"
	  .PBAVersion "2018081919" 
End With

'@ define background

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 
With Material 
     .Reset 
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1"
     .Mu "1"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With

'@ define frequency range

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solver.FrequencyRange "2.5", "3.7"

'@ set mesh properties (Hexahedral)

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Mesh 
     .MeshType "PBA" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "20" 
     .Set "StepsPerWaveFar", "10" 
     .Set "WavelengthRefinementSameAsNear", "0" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "MaxStepNear", "0" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "GeometryRefinementSameAsNear", "0" 
     'MIN CELL 
     .Set "UseRatioLimitGeometry", "1" 
     .Set "RatioLimitGeometry", "10" 
     .Set "MinStepGeometryX", "0" 
     .Set "MinStepGeometryY", "0" 
     .Set "MinStepGeometryZ", "0" 
     .Set "UseSameMinStepGeometryXYZ", "1" 
End With 
With MeshSettings 
     .Set "PlaneMergeVersion", "2" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "FaceRefinementOn", "0" 
     .Set "FaceRefinementPolicy", "2" 
     .Set "FaceRefinementRatio", "2" 
     .Set "FaceRefinementStep", "0" 
     .Set "FaceRefinementNSteps", "2" 
     .Set "EllipseRefinementOn", "0" 
     .Set "EllipseRefinementPolicy", "2" 
     .Set "EllipseRefinementRatio", "2" 
     .Set "EllipseRefinementStep", "0" 
     .Set "EllipseRefinementNSteps", "2" 
     .Set "FaceRefinementBufferLines", "3" 
     .Set "EdgeRefinementOn", "1" 
     .Set "EdgeRefinementPolicy", "1" 
     .Set "EdgeRefinementRatio", "5" 
     .Set "EdgeRefinementStep", "0" 
     .Set "EdgeRefinementBufferLines", "3" 
     .Set "RefineEdgeMaterialGlobal", "0" 
     .Set "RefineAxialEdgeGlobal", "0" 
     .Set "BufferLinesNear", "3" 
     .Set "UseDielectrics", "1" 
     .Set "EquilibrateOn", "0" 
     .Set "Equilibrate", "1.5" 
     .Set "IgnoreThinPanelMaterial", "0" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With 
With Discretizer 
     .ConnectivityCheck "True"
     .UsePecEdgeModel "True" 
     .GapDetection "True" 
     .FPBAGapTolerance "1e-3" 
     .PointAccEnhancement "0" 
     .TSTVersion "2"
	  .PBAVersion "2018081919" 
End With

'@ pick face

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickFaceFromId "Probe1:coax", "6"

'@ delete port: port1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Port.Delete "1"

'@ define port: 1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "input" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "40.7475", "44.8625" 
     .Yrange "100", "100" 
     .Zrange "13.0925", "17.2075" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ boolean insert shapes: Probe1:conductor, Probe1:coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Probe1:conductor", "Probe1:coax"

'@ boolean insert shapes: Waveguide:Waveguide, Probe1:coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Waveguide:Waveguide", "Probe1:coax"

'@ boolean insert shapes: Waveguide:Waveguide, Probe1:conductor

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Waveguide:Waveguide", "Probe1:conductor"

'@ activate global coordinates

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
WCS.ActivateWCS "global"

'@ change solver type

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
ChangeSolverType "HF Time Domain"

'@ new component: Probe2

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Component.New "Probe2"

'@ activate local coordinates

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
WCS.ActivateWCS "local"

'@ define cylinder: Probe2:solid1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "Probe2" 
     .Material "Coax" 
     .OuterRadius "coax_r" 
     .InnerRadius "0" 
     .Axis "y" 
     .Yrange "wg_h/2", "wg_h/2+wg_wall+3" 
     .Xcenter "wg_l-ant_wall_l_rx" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: Waveguide:Waveguide, Probe2:solid1

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Waveguide:Waveguide", "Probe2:solid1"

'@ rename block: Probe2:solid1 to: Probe2:coax

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Rename "Probe2:solid1", "coax"

'@ define cylinder: Probe2:conductor

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Cylinder 
     .Reset 
     .Name "conductor" 
     .Component "Probe2" 
     .Material "Copper (pure)" 
     .OuterRadius "ant_r" 
     .InnerRadius "0" 
     .Axis "y" 
     .Yrange "wg_h/2-ant_l_rx", "wg_h/2+wg_wall+3" 
     .Xcenter "wg_l-ant_wall_l_rx" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: Vacuum:Vacuum, Probe2:conductor

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solid.Insert "Vacuum:Vacuum", "Probe2:conductor"

'@ delete port: port2

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Port.Delete "2"

'@ pick face

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Pick.PickFaceFromId "Probe2:coax", "3"

'@ define port: 2

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "output" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "466.5675", "470.6825" 
     .Yrange "50", "50" 
     .Zrange "-2.0575", "2.0575" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ change solver type

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
ChangeSolverType "HF Time Domain"

'@ define frequency range

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solver.FrequencyRange "3", "3.1"

'@ set optimizer parameters

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l", "True" 
  .SetParameterInit "125.5/4" 
  .SetParameterMin "28.238" 
  .SetParameterMax "34.513" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l", "True" 
  .SetParameterInit "125.5/4" 
  .SetParameterMin "28.238" 
  .SetParameterMax "34.513" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "500" 
  .SetParameterMin "400" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0.0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0.0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0.0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "False" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ add optimizer goals: 1DC Primary Result / 0

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "max" 
  .SetGoalTarget "1" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S2,1" 
  .SetGoalScalarType "MagLin" 
  .SetGoalRange "3", "3.1" 
  .SetGoalRangeType "total" 
End With

'@ define frequency range

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Solver.FrequencyRange "3.03", "3.05"

'@ set optimizer settings

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "False" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ define time domain solver parameters

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "1"
     .StimulationMode "1"
     .SteadyStateLimit "-25"
     .MeshAdaption "False"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set optimizer parameters

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l", "True" 
  .SetParameterInit "125.5/4" 
  .SetParameterMin "10" 
  .SetParameterMax "41" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l", "True" 
  .SetParameterInit "125.5/4" 
  .SetParameterMin "20" 
  .SetParameterMax "80" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "500" 
  .SetParameterMin "400" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.0|28.0.2|20180920[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "False" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ define frequency range

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solver.FrequencyRange "3.03", "3.05"

'@ define time domain solver parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "1"
     .StimulationMode "1"
     .SteadyStateLimit "-25"
     .MeshAdaption "False"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l", "True" 
  .SetParameterInit "28.8" 
  .SetParameterMin "10" 
  .SetParameterMax "41" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l", "True" 
  .SetParameterInit "32" 
  .SetParameterMin "20" 
  .SetParameterMax "80" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "486.24670170656" 
  .SetParameterMin "400" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ define frequency range

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solver.FrequencyRange "1", "3.5"

'@ set mesh properties (Hexahedral)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Mesh 
     .MeshType "PBA" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "10" 
     .Set "StepsPerWaveFar", "5" 
     .Set "WavelengthRefinementSameAsNear", "0" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "MaxStepNear", "0" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "GeometryRefinementSameAsNear", "0" 
     'MIN CELL 
     .Set "UseRatioLimitGeometry", "1" 
     .Set "RatioLimitGeometry", "10" 
     .Set "MinStepGeometryX", "0" 
     .Set "MinStepGeometryY", "0" 
     .Set "MinStepGeometryZ", "0" 
     .Set "UseSameMinStepGeometryXYZ", "1" 
End With 
With MeshSettings 
     .Set "PlaneMergeVersion", "2" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "FaceRefinementOn", "0" 
     .Set "FaceRefinementPolicy", "2" 
     .Set "FaceRefinementRatio", "2" 
     .Set "FaceRefinementStep", "0" 
     .Set "FaceRefinementNSteps", "2" 
     .Set "EllipseRefinementOn", "0" 
     .Set "EllipseRefinementPolicy", "2" 
     .Set "EllipseRefinementRatio", "2" 
     .Set "EllipseRefinementStep", "0" 
     .Set "EllipseRefinementNSteps", "2" 
     .Set "FaceRefinementBufferLines", "3" 
     .Set "EdgeRefinementOn", "1" 
     .Set "EdgeRefinementPolicy", "1" 
     .Set "EdgeRefinementRatio", "5" 
     .Set "EdgeRefinementStep", "0" 
     .Set "EdgeRefinementBufferLines", "3" 
     .Set "RefineEdgeMaterialGlobal", "0" 
     .Set "RefineAxialEdgeGlobal", "0" 
     .Set "BufferLinesNear", "3" 
     .Set "UseDielectrics", "1" 
     .Set "EquilibrateOn", "0" 
     .Set "Equilibrate", "1.5" 
     .Set "IgnoreThinPanelMaterial", "0" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With 
With Discretizer 
     .ConnectivityCheck "True"
     .UsePecEdgeModel "True" 
     .GapDetection "True" 
     .FPBAGapTolerance "1e-3" 
     .PointAccEnhancement "0" 
     .TSTVersion "2"
	  .PBAVersion "2018081919" 
End With

'@ modify port: 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "input" 
     .Folder "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "38.2475", "42.3625" 
     .Yrange "25", "25" 
     .Zrange "13.0925", "17.2075" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 2

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "2" 
     .Label "output" 
     .Folder "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "469.0675", "473.1825" 
     .Yrange "25", "25" 
     .Zrange "-2.0575", "2.0575" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "input" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "38.2475", "42.3625" 
     .Yrange "25", "25" 
     .Zrange "13.0925", "17.2075" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ align wcs with global coordinates

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
WCS.AlignWCSWithGlobalCoordinates

'@ delete component: Probe1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Component.Delete "Probe1"

'@ delete component: Vacuum

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Component.Delete "Vacuum"

'@ delete component: Waveguide

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Component.Delete "Waveguide"

'@ new component: Probe1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Component.New "Probe1"

'@ define cylinder: Probe1:solid1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "Probe1" 
     .Material "Coax" 
     .OuterRadius "coax_r" 
     .InnerRadius "0" 
     .Axis "y" 
     .Yrange "wg_h/2", "wg_h/2+wg_wall+3" 
     .Xcenter "ant_wall_l_tx" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ rename block: Probe1:solid1 to: Probe1:coax

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Rename "Probe1:solid1", "coax"

'@ define cylinder: Probe1:conductor

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Cylinder 
     .Reset 
     .Name "conductor" 
     .Component "Probe1" 
     .Material "Copper (pure)" 
     .OuterRadius "ant_r" 
     .InnerRadius "0" 
     .Axis "y" 
     .Yrange "wg_h/2-ant_l_tx", "wg_h/2+wg_wall+3" 
     .Xcenter "ant_wall_l_tx" 
     .Zcenter "0" 
     .Segments "0" 
     .Create 
End With

'@ delete port: port1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Port.Delete "1"

'@ delete port: port2

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Port.Delete "2"

'@ new component: Waveguide

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Component.New "Waveguide"

'@ define brick: Waveguide:vacuum

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Brick
     .Reset 
     .Name "vacuum" 
     .Component "Waveguide" 
     .Material "Copper (pure)" 
     .Xrange "0", "wg_l" 
     .Yrange "-wg_h/2", "wg_h/2" 
     .Zrange "-wg_w/2", "wg_w/2" 
     .Create
End With

'@ define brick: Waveguide:walls

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Brick
     .Reset 
     .Name "walls" 
     .Component "Waveguide" 
     .Material "Aluminum" 
     .Xrange "-wg_wall", "wg_l+wg_wall" 
     .Yrange "-wg_h/2-wg_wall", "wg_h/2+wg_wall" 
     .Zrange "-wg_w/2-wg_wall", "wg_w/2+wg_wall" 
     .Create
End With

'@ boolean insert shapes: Waveguide:walls, Probe2:conductor

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Waveguide:walls", "Probe2:conductor"

'@ boolean insert shapes: Waveguide:walls, Probe1:conductor

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Waveguide:walls", "Probe1:conductor"

'@ boolean insert shapes: Waveguide:walls, Waveguide:vacuum

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Waveguide:walls", "Waveguide:vacuum"

'@ boolean insert shapes: Probe1:coax, Probe1:conductor

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Probe1:coax", "Probe1:conductor"

'@ boolean insert shapes: Waveguide:walls, Probe1:coax

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Waveguide:walls", "Probe1:coax"

'@ boolean insert shapes: Probe2:coax, Probe2:conductor

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Probe2:coax", "Probe2:conductor"

'@ boolean insert shapes: Waveguide:walls, Probe2:coax

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Waveguide:walls", "Probe2:coax"

'@ pick face

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Pick.PickFaceFromId "Probe1:coax", "6"

'@ define port: 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "input" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "30.6425", "34.7575" 
     .Yrange "25.05", "25.05" 
     .Zrange "-2.0575", "2.0575" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ pick face

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Pick.PickFaceFromId "Probe2:coax", "6"

'@ define port: 2

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "output" 
     .Folder "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "457.9425", "462.0575" 
     .Yrange "25", "25" 
     .Zrange "-2.0575", "2.0575" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "True" 
  .SetParameterInit "28.875" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "True" 
  .SetParameterInit "32.7" 
  .SetParameterMin "31.5" 
  .SetParameterMax "38.5" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.7" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "430" 
  .SetParameterMin "400" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ delete all optimizer goals

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Optimizer.DeleteAllGoals

'@ add optimizer goals: 1DC Primary Result / 0

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "min" 
  .SetGoalTarget "-120" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S1(1),1(1)" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "1", "3.5" 
  .SetGoalRangeType "total" 
End With

'@ add optimizer goals: 1DC Primary Result / 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "max" 
  .SetGoalTarget "0" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S2(1),1(1)" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "1", "3.5" 
  .SetGoalRangeType "total" 
End With

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "True" 
  .SetParameterInit "28.875" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "True" 
  .SetParameterInit "32.7" 
  .SetParameterMin "31.5" 
  .SetParameterMax "38.5" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.7" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "430" 
  .SetParameterMin "420" 
  .SetParameterMax "450" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ define frequency range

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solver.FrequencyRange "3.03", "3.05"

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ pick face

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Pick.PickFaceFromId "Waveguide:vacuum", "6"

'@ define monitor: h-field (f=3.04)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=3.04)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "wg_l/2", "wg_l/2", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field 2 (f=3.04)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field 2 (f=3.04)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "0", "0", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field @ tx antenna

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field @ tx antenna" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "ant_wall_l_tx", "ant_wall_l_tx", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: h-field 2 (f=3.04)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Delete "h-field 2 (f=3.04)" 
End With

'@ define monitor: h-field @ end-wall

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field @ end-wall" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "0", "0", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ delete monitor: h-field (f=3.04)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Delete "h-field (f=3.04)" 
End With

'@ define monitor: h-field @ midpoint

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field @ midpoint" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "wg_l/2", "wg_l/2", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: h-field @ 100mm

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field @ 100mm" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "100", "100", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: e-field @ midpoint

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field @ midpoint" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "3.04" 
     .UseSubvolume "True" 
     .Coordinates "Free" 
     .SetSubvolume "wg_l/2", "wg_l/2", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: volumetric h-field (f=3.04)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "volumetric h-field (f=3.04)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "False" 
     .Coordinates "Picks" 
     .SetSubvolume "441.73811523237", "441.73811523237", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define monitor: volumetric h-field (f=3.04)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "volumetric h-field (f=3.04)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .MonitorValue "3.04" 
     .UseSubvolume "False" 
     .Coordinates "Picks" 
     .SetSubvolume "441.73811523236998", "441.73811523236998", "-19.050000000000001", "19.050000000000001", "-47.600000000000001", "47.600000000000001" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ define boundaries

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Boundary
     .Xmin "electric"
     .Xmax "electric"
     .Ymin "electric"
     .Ymax "expanded open"
     .Zmin "electric"
     .Zmax "electric"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
     .ApplyInAllDirections "False"
End With

'@ define monitor: e-field (f=3.04)

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=3.04)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .MonitorValue "3.04" 
     .UseSubvolume "False" 
     .Coordinates "Picks" 
     .SetSubvolume "441.73811523237", "441.73811523237", "-19.05", "19.05", "-47.6", "47.6" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .SetSubvolumeInflateWithOffset "False" 
     .Create 
End With

'@ modify port: 2

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "2" 
     .Label "output" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "407.833873", "411.948873" 
     .Yrange "25.05", "25.05" 
     .Zrange "-2.0575", "2.0575" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ change material: Waveguide:vacuum to: Vacuum

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.ChangeMaterial "Waveguide:vacuum", "Vacuum"

'@ define frequency range

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solver.FrequencyRange "1", "4"

'@ define special time domain solver parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
'STEADY STATE
With Solver
     .SteadyStateDurationType "Number of pulses"
     .NumberOfPulseWidths "20"
     .SteadyStateDurationTime "1.66667"
     .SteadyStateDurationTimeAsDistance "500"
     .StopCriteriaShowExcitation "False"
     .RemoveAllStopCriteria
     .AddStopCriterion "All S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "Reflection S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "All Probes", "0.004", "1", "False"
     .AddStopCriterion "All Radiated Powers", "0.004", "1", "False"
End With
'GENERAL
With Solver
     .TimeStepStabilityFactor "1.0"
     .RestartAfterInstabilityAbort "True"
     .AutomaticTimeSignalSampling "True"
     .SuppressTimeSignalStorage "False"
     .ConsiderExcitationForFreqSamplingRate "False"
     .UseBroadBandPhaseShift "False"
     .SetBroadBandPhaseShiftLowerBoundFac "0.1"
     .SetPortShieldingType "NONE"
     .FrequencySamples "10001"
     .FrequencyLogSamples "0"
     .ConsiderTwoPortReciprocity "True"
     .EnergyBalanceLimit "0.03"
     .TDRComputation "False"
     .TDRShift50Percent "False"
     .AutoDetectIdenticalPorts "False"
End With
'HEXAHEDRAL
With Solver
     .SetPMLType "CONVPML"
     .UseVariablePMLLayerSizeStandard "False"
     .KeepPMLDepthDuringMeshAdaptationWithVariablePMLLayerSize "False"
     .SetSubcycleState "Automatic"
     .NormalizeToReferenceSignal "True"
     .SetEnhancedPMLStabilization "Automatic"
     .SimplifiedPBAMethod "False"
     .SParaAdjustment "True"
     .PrepareFarfields "True"
     .MonitorFarFieldsNearToModel "False"
     .DiscreteItemUpdate "Distributed"
End With
'MATERIAL
With Solver
     .SurfaceImpedanceOrder "10"
     .ActivatePowerLoss1DMonitor "True"
     .PowerLoss1DMonitorPerSolid "False"
     .Use3DFieldMonitorForPowerLoss1DMonitor "True"
     .UseFarFieldMonitorForPowerLoss1DMonitor "False"
     .UseExtraFreqForPowerLoss1DMonitor "False"
     .ResetPowerLoss1DMonitorExtraFreq
     .SetDispNonLinearMaterialMonitor "False"
     .ActivateDispNonLinearMaterialMonitor "0.0",  "0.02",  "0.0",  "False"
     .SetTimePowerLossSIMaterialMonitor "False"
     .ActivateTimePowerLossSIMaterialMonitor "0.0",  "0.02",  "0.0",  "False"
     .SetTimePowerLossSIMaterialMonitorAverage "False"
     .SetTimePowerLossSIMaterialMonitorAverageRepPeriod "0.0"
     .TimePowerLossSIMaterialMonitorPerSolid "False"
     .ActivateSpaceMaterial3DMonitor "False"
     .Use3DFieldMonitorForSpaceMaterial3DMonitor "True"
     .UseExtraFreqForSpaceMaterial3DMonitor "False"
     .ResetSpaceMaterial3DMonitorExtraFreq
     .SetHFTDDispUpdateScheme "Standard"
End With
'AR-FILTER
With Solver
     .UseArfilter "False"
     .ArMaxEnergyDeviation "0.1"
     .ArPulseSkip "1"
End With
'WAVEGUIDE
With Solver
     .WaveguidePortGeneralized "True"
     .WaveguidePortModeTracking "False"
     .WaveguidePortROM "False"
     .DispEpsFullDeembedding "False"
     .SetSamplesFullDeembedding "20"
     .AbsorbUnconsideredModeFields "Automatic"
     .SetModeFreqFactor "0.5"
     .AdaptivePortMeshing "True"
     .AccuracyAdaptivePortMeshing "1"
     .PassesAdaptivePortMeshing "4"
End With
'HEXAHEDRAL TLM
With Solver
     .AnisotropicSheetSurfaceType "0"
     .MultiStrandedCableRoute "False"
     .UseAbsorbingBoundary "True"
     .UseDoublePrecision "False"
     .AllowMaterialOverlap "True"
     .ExcitePlanewaveNearModel "False"
     .SetGroundPlane "False"
     .GroundPlane "x", "0.0"
     .NumberOfLayers "5"
     .AverageFieldProbe "False"
     .NormalizeToGaussian "True"
     .TimeSignalSamplingFactor "1"
End With
'TLM POSTPROCESSING
With Solver
     .ResetSettings
     .CalculateNearFieldOnCylindricalSurfaces "false", "Coarse" 
     .CylinderGridCustomStep "1" 
     .CalculateNearFieldOnCircularCuts "false" 
     .CylinderBaseCenter "0", "0", "0" 
     .CylinderRadius "3" 
     .CylinderHeight "3" 
     .CylinderSpacing "1" 
     .CylinderResolution "2.0" 
     .CylinderAllPolarization "true" 
     .CylinderRadialAngularVerticalComponents "false" 
     .CylinderMagnitudeOfTangentialConponent "false" 
     .CylinderVm "true" 
     .CylinderDBVm "false" 
     .CylinderDBUVm "false" 
     .CylinderAndFrontAxes "+y", "+z" 
     .ApplyLinearPrediction "false" 
     .Windowing "None" 
     .LogScaleFrequency "false" 
     .AutoFreqStep "true", "1"
     .SetExcitationSignal "" 
     .SaveSettings
End With

'@ boolean insert shapes: Waveguide:vacuum, Probe2:conductor

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Waveguide:vacuum", "Probe2:conductor"

'@ boolean insert shapes: Waveguide:vacuum, Probe1:conductor

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solid.Insert "Waveguide:vacuum", "Probe1:conductor"

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "True" 
  .SetParameterInit "26" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "True" 
  .SetParameterInit "35" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.7" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "430" 
  .SetParameterMin "200" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ delete all optimizer goals

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Optimizer.DeleteAllGoals

'@ add optimizer goals: 1DC Primary Result / 0

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "min" 
  .SetGoalTarget "-120" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S1,1" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "3.03", "3.05" 
  .SetGoalRangeType "range" 
End With

'@ add optimizer goals: 1DC Primary Result / 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "max" 
  .SetGoalTarget "0" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S2,1" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "3.03", "3.05" 
  .SetGoalRangeType "range" 
End With

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "True" 
  .SetParameterInit "26" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "True" 
  .SetParameterInit "35" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.7" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "430" 
  .SetParameterMin "200" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ define frequency range

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solver.FrequencyRange "3.03", "3.05"

'@ modify port: 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "input" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "30.6425", "34.7575" 
     .Yrange "25.05", "25.05" 
     .Zrange "-2.0575", "2.0575" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "PEC" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 2

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "2" 
     .Label "output" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "399.9425", "404.0575" 
     .Yrange "25.05", "25.05" 
     .Zrange "-2.0575", "2.0575" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "PEC" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ define frequency range

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solver.FrequencyRange "1", "3.7"

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "True" 
  .SetParameterInit "28.5" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "True" 
  .SetParameterInit "33" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.7" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "305" 
  .SetParameterMin "200" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ delete all optimizer goals

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Optimizer.DeleteAllGoals

'@ add optimizer goals: 1DC Primary Result / 0

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "max" 
  .SetGoalTarget "0" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S2,1" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "3.04", "3.04" 
  .SetGoalRangeType "single" 
End With

'@ add optimizer goals: 1DC Primary Result / 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "min" 
  .SetGoalTarget "-120" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S1,1" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "3.04", "3.04" 
  .SetGoalRangeType "single" 
End With

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "True" 
  .SetParameterInit "28.5" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "1.27/2" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "True" 
  .SetParameterInit "33" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.7" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "4.115/2" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "305" 
  .SetParameterMin "290" 
  .SetParameterMax "325" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "True" 
  .SetParameterInit "27.8" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "True" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "0.635" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "True" 
  .SetParameterInit "32.8" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "True" 
  .SetParameterInit "33.7" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "2.0575" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "303.31515560553999" 
  .SetParameterMin "290" 
  .SetParameterMax "400" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ set optimizer goals 1DC Primary Result / 0

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SelectGoal "0", "True" 
  .SetGoalOperator "=" 
  .SetGoalTarget "-6" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S2,1" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "3.04", "3.04" 
  .SetGoalRangeType "single" 
End With

'@ define frequency range

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Solver.FrequencyRange "1", "4"

'@ define special time domain solver parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
'STEADY STATE
With Solver
     .SteadyStateDurationType "Number of pulses"
     .NumberOfPulseWidths "20"
     .SteadyStateDurationTime "1.66667"
     .SteadyStateDurationTimeAsDistance "500"
     .StopCriteriaShowExcitation "False"
     .RemoveAllStopCriteria
     .AddStopCriterion "All S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "Transmission S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "Reflection S-Parameters", "0.004", "1", "False"
     .AddStopCriterion "All Probes", "0.004", "1", "False"
     .AddStopCriterion "All Radiated Powers", "0.004", "1", "False"
End With
'GENERAL
With Solver
     .TimeStepStabilityFactor "1.0"
     .RestartAfterInstabilityAbort "True"
     .AutomaticTimeSignalSampling "True"
     .SuppressTimeSignalStorage "False"
     .ConsiderExcitationForFreqSamplingRate "False"
     .UseBroadBandPhaseShift "False"
     .SetBroadBandPhaseShiftLowerBoundFac "0.1"
     .SetPortShieldingType "NONE"
     .FrequencySamples "1001"
     .FrequencyLogSamples "0"
     .ConsiderTwoPortReciprocity "True"
     .EnergyBalanceLimit "0.03"
     .TDRComputation "False"
     .TDRShift50Percent "False"
     .AutoDetectIdenticalPorts "False"
End With
'HEXAHEDRAL
With Solver
     .SetPMLType "CONVPML"
     .UseVariablePMLLayerSizeStandard "False"
     .KeepPMLDepthDuringMeshAdaptationWithVariablePMLLayerSize "False"
     .SetSubcycleState "Automatic"
     .NormalizeToReferenceSignal "True"
     .SetEnhancedPMLStabilization "Automatic"
     .SimplifiedPBAMethod "False"
     .SParaAdjustment "True"
     .PrepareFarfields "True"
     .MonitorFarFieldsNearToModel "False"
     .DiscreteItemUpdate "Distributed"
End With
'MATERIAL
With Solver
     .SurfaceImpedanceOrder "10"
     .ActivatePowerLoss1DMonitor "True"
     .PowerLoss1DMonitorPerSolid "False"
     .Use3DFieldMonitorForPowerLoss1DMonitor "True"
     .UseFarFieldMonitorForPowerLoss1DMonitor "False"
     .UseExtraFreqForPowerLoss1DMonitor "False"
     .ResetPowerLoss1DMonitorExtraFreq
     .SetDispNonLinearMaterialMonitor "False"
     .ActivateDispNonLinearMaterialMonitor "0.0",  "0.02",  "0.0",  "False"
     .SetTimePowerLossSIMaterialMonitor "False"
     .ActivateTimePowerLossSIMaterialMonitor "0.0",  "0.02",  "0.0",  "False"
     .SetTimePowerLossSIMaterialMonitorAverage "False"
     .SetTimePowerLossSIMaterialMonitorAverageRepPeriod "0.0"
     .TimePowerLossSIMaterialMonitorPerSolid "False"
     .ActivateSpaceMaterial3DMonitor "False"
     .Use3DFieldMonitorForSpaceMaterial3DMonitor "True"
     .UseExtraFreqForSpaceMaterial3DMonitor "False"
     .ResetSpaceMaterial3DMonitorExtraFreq
     .SetHFTDDispUpdateScheme "Standard"
End With
'AR-FILTER
With Solver
     .UseArfilter "False"
     .ArMaxEnergyDeviation "0.1"
     .ArPulseSkip "1"
End With
'WAVEGUIDE
With Solver
     .WaveguidePortGeneralized "True"
     .WaveguidePortModeTracking "False"
     .WaveguidePortROM "False"
     .DispEpsFullDeembedding "False"
     .SetSamplesFullDeembedding "20"
     .AbsorbUnconsideredModeFields "Automatic"
     .SetModeFreqFactor "0.5"
     .AdaptivePortMeshing "True"
     .AccuracyAdaptivePortMeshing "1"
     .PassesAdaptivePortMeshing "4"
End With
'HEXAHEDRAL TLM
With Solver
     .AnisotropicSheetSurfaceType "0"
     .MultiStrandedCableRoute "False"
     .UseAbsorbingBoundary "True"
     .UseDoublePrecision "False"
     .AllowMaterialOverlap "True"
     .ExcitePlanewaveNearModel "False"
     .SetGroundPlane "False"
     .GroundPlane "x", "0.0"
     .NumberOfLayers "5"
     .AverageFieldProbe "False"
     .NormalizeToGaussian "True"
     .TimeSignalSamplingFactor "1"
End With
'TLM POSTPROCESSING
With Solver
     .ResetSettings
     .CalculateNearFieldOnCylindricalSurfaces "false", "Coarse" 
     .CylinderGridCustomStep "1" 
     .CalculateNearFieldOnCircularCuts "false" 
     .CylinderBaseCenter "0", "0", "0" 
     .CylinderRadius "3" 
     .CylinderHeight "3" 
     .CylinderSpacing "1" 
     .CylinderResolution "2.0" 
     .CylinderAllPolarization "true" 
     .CylinderRadialAngularVerticalComponents "false" 
     .CylinderMagnitudeOfTangentialConponent "false" 
     .CylinderVm "true" 
     .CylinderDBVm "false" 
     .CylinderDBUVm "false" 
     .CylinderAndFrontAxes "+y", "+z" 
     .ApplyLinearPrediction "false" 
     .Windowing "None" 
     .LogScaleFrequency "false" 
     .AutoFreqStep "true", "1"
     .SetExcitationSignal "" 
     .SaveSettings
End With

'@ pick face

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Pick.PickFaceFromId "Waveguide:vacuum", "12"

'@ define port: 3

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .PortNumber "3" 
     .Label "mid-point" 
     .Folder "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Free" 
     .Orientation "xmax" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "wg_l/2", "wg_l/2" 
     .Yrange "-19.05", "19.05" 
     .Zrange "-47.6", "47.6" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .WaveguideMonitor "False" 
     .Create 
End With

'@ modify port: 3

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "3" 
     .Label "mid-point" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Free" 
     .Orientation "xmax" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "wg_l/2", "wg_l/2" 
     .Yrange "-19.05", "19.05" 
     .Zrange "-47.6", "47.6" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ modify port: 3

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "3" 
     .Label "mid-point" 
     .Folder "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Free" 
     .Orientation "xmax" 
     .PortOnBound "False" 
     .ClipPickedPortToBound "False" 
     .Xrange "wg_l/2", "wg_l/2" 
     .Yrange "-19.05", "19.05" 
     .Zrange "-47.6", "47.6" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "PEC" 
     .WaveguideMonitor "False" 
     .Modify 
End With

'@ delete port: port3

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Port.Delete "3"

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "False" 
  .SetParameterInit "26.77" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "0.635" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "False" 
  .SetParameterInit "32.8" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.8" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "2.0575" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "485" 
  .SetParameterMin "470" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With

'@ delete all optimizer goals

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
Optimizer.DeleteAllGoals

'@ add optimizer goals: 1DC Primary Result / 0

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "min" 
  .SetGoalTarget "-120" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S1,1" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "3.04", "3.04" 
  .SetGoalRangeType "single" 
End With

'@ add optimizer goals: 1DC Primary Result / 1

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .AddGoal "1DC Primary Result" 
  .SetGoalOperator "max" 
  .SetGoalTarget "0" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "MaxDiff" 
  .SetGoal1DCResultName "1D Results\S-Parameters\S2,1" 
  .SetGoalScalarType "MagdB20" 
  .SetGoalRange "3.04", "3.04" 
  .SetGoalRangeType "single" 
End With

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "False" 
  .SetParameterInit "26.77" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "0.635" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "False" 
  .SetParameterInit "32.8" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.8" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "2.0575" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "485" 
  .SetParameterMin "470" 
  .SetParameterMax "500" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With 

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "ant_l_rx", "False" 
  .SetParameterInit "26.77" 
  .SetParameterMin "25.988" 
  .SetParameterMax "31.763" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_l_tx", "False" 
  .SetParameterInit "26" 
  .SetParameterMin "23.4" 
  .SetParameterMax "28.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_r", "False" 
  .SetParameterInit "0.635" 
  .SetParameterMin "0.5715" 
  .SetParameterMax "0.6985" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_rx", "False" 
  .SetParameterInit "32.8" 
  .SetParameterMin "26" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "ant_wall_l_tx", "False" 
  .SetParameterInit "32.8" 
  .SetParameterMin "29.43" 
  .SetParameterMax "35.97" 
  .SetParameterAnchors "5" 
  .SelectParameter "coax_r", "False" 
  .SetParameterInit "2.0575" 
  .SetParameterMin "1.8518" 
  .SetParameterMax "2.2633" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_h", "False" 
  .SetParameterInit "38.1" 
  .SetParameterMin "34.29" 
  .SetParameterMax "41.91" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_l", "True" 
  .SetParameterInit "365" 
  .SetParameterMin "330" 
  .SetParameterMax "400" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_w", "False" 
  .SetParameterInit "95.2" 
  .SetParameterMin "85.68" 
  .SetParameterMax "104.72" 
  .SetParameterAnchors "5" 
  .SelectParameter "wg_wall", "False" 
  .SetParameterInit "3" 
  .SetParameterMin "2.7" 
  .SetParameterMax "3.3" 
  .SetParameterAnchors "5" 
End With 


'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Time Domain Solver" 
  .SetAccuracy "0.01" 
  .SetNumRefinements "1" 
  .SetGenerationSize "32", "Genetic_Algorithm" 
  .SetGenerationSize "30", "Particle_Swarm" 
  .SetMaxIt "30", "Genetic_Algorithm" 
  .SetMaxIt "15", "Particle_Swarm" 
  .SetMaxEval "3000", "CMAES" 
  .SetUseMaxEval "True", "CMAES" 
  .SetSigma "0.2", "CMAES" 
  .SetSeed "1", "CMAES" 
  .SetSeed "1", "Genetic_Algorithm" 
  .SetSeed "1", "Particle_Swarm" 
  .SetSeed "1", "Nelder_Mead_Simplex" 
  .SetMaxEval "500", "Trust_Region" 
  .SetUseMaxEval "False", "Trust_Region" 
  .SetSigma "0.2", "Trust_Region" 
  .SetDomainAccuracy "0.01", "Trust_Region" 
  .SetFiniteDiff "0", "Trust_Region" 
  .SetMaxEval "250", "Nelder_Mead_Simplex" 
  .SetUseMaxEval "False", "Nelder_Mead_Simplex" 
  .SetUseInterpolation "No_Interpolation", "Genetic_Algorithm" 
  .SetUseInterpolation "No_Interpolation", "Particle_Swarm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Genetic_Algorithm" 
  .SetInitialDistribution "Latin_Hyper_Cube", "Particle_Swarm" 
  .SetInitialDistribution "Noisy_Latin_Hyper_Cube", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "Nelder_Mead_Simplex" 
  .SetUsePreDefPointInInitDistribution "True", "CMAES" 
  .SetGoalFunctionLevel "0", "Genetic_Algorithm" 
  .SetGoalFunctionLevel "0", "Particle_Swarm" 
  .SetGoalFunctionLevel "0", "Nelder_Mead_Simplex" 
  .SetMutaionRate "60", "Genetic_Algorithm" 
  .SetMinSimplexSize "1e-6" 
  .SetGoalSummaryType "Sum_All_Goals" 
  .SetUseDataOfPreviousCalculations "True" 
  .SetDataStorageStrategy "None" 
  .SetOptionMoveMesh "False" 
End With 


