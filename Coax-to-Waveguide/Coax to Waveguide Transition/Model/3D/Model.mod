'# MWS Version: Version 2019.7 - Jul 05 2019 - ACIS 28.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 8.5 fmax = 12.5


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
WCS.MoveWCS "local", "0.0", "-(dCoaxBorder+rCoax)", "0.0"

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
     .Layer "Coax" 
     .OuterRadius "rCoax" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-3.25", "4" 
     .Xcenter "0" 
     .Ycenter "0" 
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
WCS.MoveWCS "local", "0.0", "-(rCoax+dCoaxStub1+rStubs)", "-10.16"

'@ define cylinder: PEC:stub1

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "stub1" 
     .Layer "PEC" 
     .OuterRadius "rStubs" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "0", "hStub1+hStub2" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Create 
End With

'@ move wcs

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
WCS.MoveWCS "local", "0.0", "-dStub1Stub2-2*rStubs", "0.0"

'@ define cylinder: PEC:stub2

'[VERSION]2008.2|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "stub2" 
     .Layer "PEC" 
     .OuterRadius "rStubs" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "0", "hStub2" 
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

