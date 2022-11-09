'# MWS Version: Version 2019.7 - Jul 05 2019 - ACIS 28.0.2 -

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
     .OuterRadius "a+w" 
     .InnerRadius "a" 
     .Axis "z" 
     .Zrange "10", "10+d" 
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
     .OuterRadius "a" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "10", "10+d" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

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

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "h", "False" 
  .SetParameterInit "16" 
  .SetParameterMin "14.4" 
  .SetParameterMax "17.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "r", "False" 
  .SetParameterInit "21" 
  .SetParameterMin "18.9" 
  .SetParameterMax "23.1" 
  .SetParameterAnchors "5" 
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
  .SetGoal0DResultName "1D Results\Mode Frequencies\Mode 1" 
End With

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "h", "True" 
  .SetParameterInit "16" 
  .SetParameterMin "14.4" 
  .SetParameterMax "17.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "r", "True" 
  .SetParameterInit "21" 
  .SetParameterMin "18.9" 
  .SetParameterMax "23.1" 
  .SetParameterAnchors "5" 
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

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "h", "True" 
  .SetParameterInit "16" 
  .SetParameterMin "14.4" 
  .SetParameterMax "17.6" 
  .SetParameterAnchors "5" 
  .SelectParameter "r", "True" 
  .SetParameterInit "21" 
  .SetParameterMin "18.9" 
  .SetParameterMax "23.1" 
  .SetParameterAnchors "5" 
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

'@ define material: Copper (pure)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
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
.Mue "1.0" 
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
.Mue "1.0" 
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
.DispModelMue "None" 
.DispersiveFittingSchemeEps "Nth Order" 
.DispersiveFittingSchemeMue "Nth Order"
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.Colour "1", "1", "0" 
.Wireframe "False" 
.Reflection "False" 
.Allowoutline "True" 
.Transparentoutline "False" 
.Transparency "0" 
.Create
End With

'@ rename block: component1:Shield to: component1:Cavity

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Rename "component1:Shield", "Cavity"

'@ change material: component1:Cavity to: Copper (pure)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.ChangeMaterial "component1:Cavity", "Copper (pure)"

'@ define cylinder: component1:Endcap_bottom

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Endcap_bottom" 
     .Component "component1" 
     .Material "Copper (pure)" 
     .OuterRadius "dia/2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "0", "10" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:Endcap_top

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Endcap_top" 
     .Component "component1" 
     .Material "Copper (pure)" 
     .OuterRadius "dia/2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "d+10", "d+20" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ rename block: component1:Cavity to: component1:Pipe

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Rename "component1:Cavity", "Pipe"

'@ delete shape: component1:Endcap_bottom

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Delete "component1:Endcap_bottom"

'@ delete shape: component1:Endcap_top

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Delete "component1:Endcap_top"

'@ define cylinder: component1:Endcap_bottom

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Endcap_bottom" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "dia/2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "0", "10" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:Endcap_top

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Endcap_top" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "dia/2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "d+10", "d+20" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:Pipe2

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Pipe2" 
     .Component "component1" 
     .Material "Copper (pure)" 
     .OuterRadius "a+w" 
     .InnerRadius "a" 
     .Axis "z" 
     .Zrange "10", "10+d" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ delete shape: component1:Pipe

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Delete "component1:Pipe"

'@ rename block: component1:Pipe2 to: component1:Pipe

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Rename "component1:Pipe2", "Pipe"

'@ rename block: component1:InternalSpace to: component1:InternalSpaceOld

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Rename "component1:InternalSpace", "InternalSpaceOld"

'@ define cylinder: component1:InternalSpace

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "InternalSpace" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "a" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "10", "10+d" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ delete shape: component1:InternalSpaceOld

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Delete "component1:InternalSpaceOld"

'@ change material: component1:Endcap_bottom to: Copper (pure)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.ChangeMaterial "component1:Endcap_bottom", "Copper (pure)"

'@ change material: component1:Endcap_top to: Copper (pure)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.ChangeMaterial "component1:Endcap_top", "Copper (pure)"

'@ change solver type

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
ChangeSolverType "HF Eigenmode"

'@ set parametersweep options

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With ParameterSweep
    .SetSimulationType "Eigenmode" 
End With

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "d", "False" 
  .SetParameterInit "131.3" 
  .SetParameterMin "119.7" 
  .SetParameterMax "146.3" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "False" 
  .SetParameterInit "133" 
  .SetParameterMin "119.7" 
  .SetParameterMax "146.3" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.5" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
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

'@ set optimizer goals 0D Primary Result / 0

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SelectGoal "0", "True" 
  .SetGoalOperator "=" 
  .SetGoalTarget "3035732439" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "Diff" 
  .SetGoal0DResultName "1D Results\Mode Frequencies\Mode 1" 
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

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "d", "False" 
  .SetParameterInit "131.3" 
  .SetParameterMin "119.7" 
  .SetParameterMax "146.3" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "True" 
  .SetParameterInit "133" 
  .SetParameterMin "14" 
  .SetParameterMax "140" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.5" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
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

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "d", "True" 
  .SetParameterInit "131.3" 
  .SetParameterMin "40" 
  .SetParameterMax "250" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "True" 
  .SetParameterInit "133" 
  .SetParameterMin "14" 
  .SetParameterMax "140" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.5" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
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

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "d", "True" 
  .SetParameterInit "131.3" 
  .SetParameterMin "20" 
  .SetParameterMax "250" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "True" 
  .SetParameterInit "133" 
  .SetParameterMin "14" 
  .SetParameterMax "140" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.5" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
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

'@ set optimizer parameters

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "d", "True" 
  .SetParameterInit "45" 
  .SetParameterMin "45" 
  .SetParameterMax "250" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "True" 
  .SetParameterInit "54" 
  .SetParameterMin "51" 
  .SetParameterMax "219" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.5" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
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
     .SetNumberOfModes "25" 
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

'@ set mesh properties (Hexahedral)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With MeshSettings
     .SetMeshType "Hex" 
     .Set "Version", 0%
End With
With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "10.0" 
     .LinesPerWavelength "50" 
     .MinimumStepNumber "10" 
     .Automesh "True" 
     .MeshType "PBA" 
     .SetCreator "High Frequency" 
End With

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
     .SetNumberOfModes "50" 
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

'@ define cylinder: component1:Screw

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Screw" 
     .Component "component1" 
     .Material "Copper (pure)" 
     .OuterRadius "dia_screw/2" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "d-protrusion", "d-protrusion+50" 
     .Xcenter "100" 
     .Ycenter "100" 
     .Segments "0" 
     .Create 
End With

'@ new component: component1/Resonator

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Component.New "component1/Resonator"

'@ rename component: component1/Resonator to: Resonator

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Component.Rename "component1/Resonator", "Resonator"

'@ define cylinder: Resonator:Pipe

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Pipe" 
     .Component "Resonator" 
     .Material "Vacuum" 
     .OuterRadius "a+w" 
     .InnerRadius "a" 
     .Axis "z" 
     .Zrange "0", "d" 
     .Xcenter "100" 
     .Ycenter "100" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: Resonator:Endcap_bottom

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "Endcap_bottom" 
     .Component "Resonator" 
     .Material "Copper (pure)" 
     .OuterRadius "dia/2" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "-10", "0" 
     .Xcenter "100" 
     .Ycenter "100" 
     .Segments "0" 
     .Create 
End With

'@ change material: Resonator:Pipe to: Copper (pure)

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.ChangeMaterial "Resonator:Pipe", "Copper (pure)"

'@ define cylinder: Resonator:solid1

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "Resonator" 
     .Material "Copper (pure)" 
     .OuterRadius "dia/2" 
     .InnerRadius "dia_screw/2" 
     .Axis "z" 
     .Zrange "d", "d+10" 
     .Xcenter "100" 
     .Ycenter "100" 
     .Segments "0" 
     .Create 
End With

'@ rename block: Resonator:solid1 to: Resonator:Endcap_top

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Rename "Resonator:solid1", "Endcap_top"

'@ change component: component1:Screw to: Resonator:Screw

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.ChangeComponent "component1:Screw", "Resonator"

'@ define cylinder: Resonator:InternalSpace

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Cylinder 
     .Reset 
     .Name "InternalSpace" 
     .Component "Resonator" 
     .Material "Vacuum" 
     .OuterRadius "a" 
     .InnerRadius "0" 
     .Axis "z" 
     .Zrange "0", "d" 
     .Xcenter "100" 
     .Ycenter "100" 
     .Segments "0" 
     .Create 
End With

'@ boolean insert shapes: Resonator:InternalSpace, Resonator:Screw

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Solid.Insert "Resonator:InternalSpace", "Resonator:Screw"

'@ delete component: component1

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
Component.Delete "component1"

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
  .SelectParameter "d", "False" 
  .SetParameterInit "137.2" 
  .SetParameterMin "45" 
  .SetParameterMax "250" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "False" 
  .SetParameterInit "67" 
  .SetParameterMin "51" 
  .SetParameterMax "219" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia_screw", "True" 
  .SetParameterInit "20" 
  .SetParameterMin "3" 
  .SetParameterMax "30" 
  .SetParameterAnchors "5" 
  .SelectParameter "protrusion", "True" 
  .SetParameterInit "5" 
  .SetParameterMin "0" 
  .SetParameterMax "10" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.35" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
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

'@ set optimizer goals 0D Primary Result / 0

'[VERSION]2016.7|25.0.2|20161111[/VERSION]
With Optimizer
  .SelectGoal "0", "True" 
  .SetGoalOperator "=" 
  .SetGoalTarget "3025000000" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "Diff" 
  .SetGoal0DResultName "1D Results\Mode Frequencies\Mode 1" 
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
     .AKSAccuracy "1e-12" 
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

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "d", "False" 
  .SetParameterInit "137.2" 
  .SetParameterMin "45" 
  .SetParameterMax "250" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "False" 
  .SetParameterInit "67" 
  .SetParameterMin "51" 
  .SetParameterMax "219" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia_screw", "False" 
  .SetParameterInit "36" 
  .SetParameterMin "3" 
  .SetParameterMax "30" 
  .SetParameterAnchors "5" 
  .SelectParameter "protrusion", "True" 
  .SetParameterInit "10" 
  .SetParameterMin "0" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.35" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
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

'@ set optimizer goals 0D Primary Result / 0

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SelectGoal "0", "True" 
  .SetGoalOperator "=" 
  .SetGoalTarget "3035000000" 
  .UseSlope "False" 
  .SetGoalTargetMax "0.0" 
  .SetGoalWeight "1.0" 
  .SetGoalNormNew "Diff" 
  .SetGoal0DResultName "1D Results\Mode Frequencies\Mode 1" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
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

'@ set optimizer parameters

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
With Optimizer
  .SetMinMaxAuto "10" 
  .SetAlwaysStartFromCurrent "True" 
  .ResetParameterList
  .SelectParameter "d", "False" 
  .SetParameterInit "137.2" 
  .SetParameterMin "45" 
  .SetParameterMax "250" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia", "False" 
  .SetParameterInit "67" 
  .SetParameterMin "51" 
  .SetParameterMax "219" 
  .SetParameterAnchors "5" 
  .SelectParameter "dia_screw", "False" 
  .SetParameterInit "36" 
  .SetParameterMin "3" 
  .SetParameterMax "30" 
  .SetParameterAnchors "5" 
  .SelectParameter "protrusion", "True" 
  .SetParameterInit "10" 
  .SetParameterMin "0" 
  .SetParameterMax "50" 
  .SetParameterAnchors "5" 
  .SelectParameter "w", "False" 
  .SetParameterInit "1.35" 
  .SetParameterMin "1.35" 
  .SetParameterMax "1.65" 
  .SetParameterAnchors "5" 
End With

'@ set optimizer settings

'[VERSION]2019.7|28.0.2|20190705[/VERSION]
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

