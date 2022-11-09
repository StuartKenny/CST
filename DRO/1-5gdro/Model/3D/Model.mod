'# MWS Version: Version 2016.7 - Nov 11 2016 - ACIS 25.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.5 fmax = 2.5


'@ define units

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Units 
     .Geometry "mm" 
     .Frequency "GHz" 
     .Time "ns" 
     .TemperatureUnit "Kelvin" 
     .Voltage "V" 
     .Current "A" 
     .Resistance "Ohm" 
     .Conductance "S" 
     .Capacitance "pF" 
     .Inductance "nH" 
End With

'@ define frequency range

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
Solver.FrequencyRange "0.5", "2.5"

'@ define material: Aluminum

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Material
     .Reset
     .Name "Aluminum"
.FrqType "static" 
.Type "Normal" 
.Epsilon "1" 
.Mue "1.0" 
.Kappa "3.72e+007" 
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
.DispModelMue "None" 
.DispersiveFittingSchemeEps "General 1st" 
.DispersiveFittingSchemeMue "General 1st" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.FrqType "all" 
.Type "Lossy metal" 
.Mue "1.0" 
.Kappa "3.72e+007" 
.Rho "0.0" 
.ThermalType "Normal" 
.ThermalConductivity "237.0" 
.Colour "1", "1", "0" 
.Wireframe "False" 
.Transparency "0" 
.Create
End With

'@ new component: component1

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
Component.New "component1"

'@ define cylinder: component1:Shield

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "Shield" 
     .Component "component1" 
     .Material "Aluminum" 
     .OuterRadius "90" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "125", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:InternalSpace

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "InternalSpace" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "70" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "30", "120" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: component1:Shield, component1:InternalSpace

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
Solid.Insert "component1:Shield", "component1:InternalSpace"

'@ define material: Alumina (99.5%) (lossy)

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Material
     .Reset
     .Name "Alumina (99.5%) (lossy)"
.FrqType "all" 
.Type "Normal" 
.Epsilon "9.9" 
.Mue "1.0" 
.Kappa "0.0" 
.TanD "0.0001" 
.TanDFreq "0.0" 
.TanDGiven "True" 
.TanDModel "ConstTanD" 
.KappaM "0.0" 
.TanDM "0.0" 
.TanDMFreq "0.0" 
.TanDMGiven "False" 
.TanDMModel "ConstKappa" 
.DispModelEps "None" 
.DispModelMue "None" 
.DispersiveFittingSchemeEps "General 1st" 
.DispersiveFittingSchemeMue "General 1st" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.Rho "0.0" 
.ThermalType "Normal" 
.ThermalConductivity "0" 
.Colour "0.94", "0.82", "0.76" 
.Wireframe "False" 
.Transparency "0" 
.Create
End With

'@ define cylinder: component1:PuckSupport

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "PuckSupport" 
     .Component "component1" 
     .Material "Alumina (99.5%) (lossy)" 
     .OuterRadius "10" 
     .InnerRadius "9" 
     .Axis "z" 
     .Zrange "30", "30+41.1-15.94" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: component1:InternalSpace, component1:PuckSupport

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
Solid.Insert "component1:InternalSpace", "component1:PuckSupport"

'@ define cylinder: component1:Puck

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Cylinder 
     .Reset 
     .Name "Puck" 
     .Component "component1" 
     .Material "Alumina (99.5%) (lossy)" 
     .OuterRadius "21" 
     .InnerRadius "10" 
     .Axis "z" 
     .Zrange "30+41.1-15.94", "30+41.1" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: component1:InternalSpace, component1:Puck

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
Solid.Insert "component1:InternalSpace", "component1:Puck"

'@ define material: MorganD30

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Material 
     .Reset 
     .Name "MorganD30"
     .FrqType "all" 
     .Type "Normal" 
     .Epsilon "30" 
     .Mue "1" 
     .Kappa "0" 
     .TanD "1.6667E-5" 
     .TanDFreq "2" 
     .TanDGiven "True" 
     .TanDModel "ConstTanD" 
     .KappaM "0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstTanD" 
     .DispModelEps "None" 
     .DispModelMue "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMue "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMue "False" 
     .Rho "0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
     .HeatCapacity "0" 
     .Colour "0", "1", "1" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ change material: component1:Puck to: MorganD30

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
Solid.ChangeMaterial "component1:Puck", "MorganD30"

'@ define material: Alumina (99.5%) (lossy)

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
With Material 
     .Reset 
     .Name "Alumina (99.5%) (lossy)"
     .FrqType "all" 
     .Type "Normal" 
     .Epsilon "9.4" 
     .Mue "1.0" 
     .Kappa "0.0" 
     .TanD "1.6667E-5" 
     .TanDFreq "2" 
     .TanDGiven "True" 
     .TanDModel "ConstTanD" 
     .KappaM "0.0" 
     .TanDM "0.0" 
     .TanDMFreq "0.0" 
     .TanDMGiven "False" 
     .TanDMModel "ConstTanD" 
     .DispModelEps "None" 
     .DispModelMue "None" 
     .DispersiveFittingSchemeEps "General 1st" 
     .DispersiveFittingSchemeMue "General 1st" 
     .UseGeneralDispersionEps "False" 
     .UseGeneralDispersionMue "False" 
     .Rho "0.0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0" 
     .HeatCapacity "0" 
     .Colour "0.94", "0.82", "0.76" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ change material: component1:PuckSupport to: Alumina (99.5%) (lossy)

'[VERSION]2008.6|18.0.3|20090230[/VERSION]
Solid.ChangeMaterial "component1:PuckSupport", "Alumina (99.5%) (lossy)"

'@ define aks solver parameters

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver
     .CalculationType "Eigenmode" 
     .EigenmodeSolverType "AKS" 
     .EigenmodeSolverMeshType "Hexahedral Mesh" 
     .AKSReset 
     .AKSModes "10" 
     .AKSPenaltyFactor "1" 
     .AKSEstimation "0" 
     .AKSAutomaticEstimation "True" 
     .AKSEstimationCycles "5" 
     .AKSIterations "2" 
     .AKSAccuracy "1e-012" 
     .StoreEigenmodeResultsInCache "False" 
     .AKSAdaptionActive "False" 
     .CalculateExternalQFactor "False" 
     .EigenmodeSolverUsePerturbation "False" 
     .ConsiderStaticModes "True" 
     .ModesInFrequencyRange "False" 
     .FrequencyTarget "True", "0.0" 
     .EigenmodeSolverAccuracy "1e-6" 
     .EigenmodeQExternalAccuracy "1e-4" 
     .EigenmodeSolverEpsFrequency "True", "" 
     .EigenmodeSolverTDCompatibleMaterials "False" 
End With

'@ set pba mesh type

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
Mesh.MeshType "PBA"

'@ align wcs with point

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
Pick.PickExtraCirclepointFromId "component1:PuckSupport", "2", "1", "0" 
WCS.AlignWCSWithSelectedPoint

'@ align wcs with point

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
Pick.PickExtraCirclepointFromId "component1:Puck", "4", "4", "2" 
WCS.AlignWCSWithSelectedPoint

'@ align wcs with point

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
Pick.PickExtraCirclepointFromId "component1:Puck", "2", "1", "2" 
WCS.AlignWCSWithSelectedPoint

'@ align wcs with global plane

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
With WCS
     .SetNormal "0", "0", "1"
     .SetUVector "1", "0", "0"
     .ActivateWCS "local" 
End With

'@ move wcs

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
WCS.MoveWCS "local", "0.0", "0.0", "10"

'@ define curve line: curve1:line1

'[VERSION]2011.2|21.0.0|20110408[/VERSION]
With Line
     .Reset 
     .Name "line1" 
     .Curve "curve1" 
     .X1 "0" 
     .Y1 "-20" 
     .X2 "0" 
     .Y2 "40" 
     .Create
End With

'@ set units in materials

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Material.SetUnitInMaterial "Alumina (99.5%) (lossy)", "GHz", "mm" 
Material.SetUnitInMaterial "Aluminum", "GHz", "mm" 
Material.SetUnitInMaterial "MorganD30", "GHz", "mm"

'@ set mesh properties (for backward compatibility)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 0%
     .SetMeshType "Tet"
     .Set "Version", 0%
     .SetMeshType "Srf"
     .Set "Version", 0%
End With
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "CellsPerWavelengthPolicy", "cellsperwavelength" 
     .Set "CurvatureOrderPolicy", "off" 
     .SetMeshType "Plane" 
     .Set "CurvatureOrderPolicy", "off" 
End With

'@ change solver type

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
ChangeSolverType "HF Eigenmode"

'@ define eigenmode solver parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Mesh.SetCreator "High Frequency" 
EigenmodeSolver.Reset 
With Solver
     .CalculationType "Eigenmode" 
     .AKSReset 
     .AKSPenaltyFactor "1" 
     .AKSEstimation "0" 
     .AKSAutomaticEstimation "True" 
     .AKSEstimationCycles "5" 
     .AKSIterations "2" 
     .AKSAccuracy "1e-012" 
End With
With EigenmodeSolver 
     .SetMethod "AKS" 
     .SetMeshType "Hexahedral Mesh" 
     .SetMeshAdaptationHex "False" 
     .SetMeshAdaptationTet "False" 
     .SetNumberOfModes "10" 
     .SetStoreResultsInCache "False" 
     .SetCalculateExternalQFactor "False" 
     .SetConsiderStaticModes "True" 
     .SetCalculateThermalLosses "True" 
     .SetModesInFrequencyRange "False" 
     .SetFrequencyTarget "True", "0.0" 
     .SetAccuracy "1e-6" 
     .SetQExternalAccuracy "1e-4" 
     .SetMaterialEvaluationFrequency "True", "" 
     .SetTDCompatibleMaterials "False" 
     .SetOrderTet "2" 
     .SetUseSensitivityAnalysis "False" 
     .SetConsiderLossesInPostprocessingOnly "False" 
     .SetUseParallelization "True"
     .SetMaxNumberOfThreads "72"
     .MaximumNumberOfCPUDevices "2"
     .SetRemoteCalculation "False"
End With
UseDistributedComputingForParameters "False"
MaxNumberOfDistributedComputingParameters "2"
UseDistributedComputingMemorySetting "False"
MinDistributedComputingMemoryLimit "0"
UseDistributedComputingSharedDirectory "False"

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
End With

'@ set optimizer settings

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Eigenmode Solver" 
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

'@ add optimizer goals: 0D Primary Result / 0

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer 
  .AddGoal "0D Primary Result" 
  .SetGoalOperator "=" 
  .SetGoalTarget "1500000000" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "Diff" 
  .SetGoal0DResultName "1D Results\Mode Frequencies\Mode 10" 
End With

'@ set optimizer settings

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer 
  .SetOptimizerType "Trust_Region" 
  .SetSimulationType "Eigenmode Solver" 
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

'@ delete all optimizer goals

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Optimizer.DeleteAllGoals

'@ change solver type

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
ChangeSolverType "HF Eigenmode" 

'@ set mesh properties (Hexahedral)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With MeshSettings
     .SetMeshType "Hex" 
     .Set "Version", 0%
End With

With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "10.0" 
     .LinesPerWavelength "15" 
     .MinimumStepNumber "10" 
     .Automesh "True" 
     .MeshType "PBA" 
     .SetCreator "High Frequency" 
End With 


