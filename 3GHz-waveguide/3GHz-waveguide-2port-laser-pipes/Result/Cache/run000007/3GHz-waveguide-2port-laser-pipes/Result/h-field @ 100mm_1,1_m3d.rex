<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile creator="Solver HFTD - Field 3DFD Monitor" version="20170330">
  <SpecialMaterials>
    <Background type="NORMAL"/>
    <Material name="Aluminum" type="FIELDFREE"/>
    <Material name="Copper (pure)" type="FIELDFREE"/>
  </SpecialMaterials>
  <SimulationProperties dB_Amplitude="20" encoded_unit="&amp;U:A^1.:m^-1" fieldname="&lt;name missing&gt;" fieldtype="H-Field" frequency="3.0350000858306884766"/>
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <ResultGroups num_steps="1">
    <Frame index="0">
      <FieldResultFile filename="h-field @ 100mm_1,1.m3d" type="m3d"/>
    </Frame>
  </ResultGroups>
  <ResultDataType complex="1" timedomain="0" vector="1"/>
  <SimulationDomain min="-3.200000047684 -22.25 -80.77924346924" max="331.2623291016 55.22924423218 160.7792510986"/>
  <PlotSettings Clipping="Possible" Plot="4" ignore_symmetry="0" deformation="0"/>
  <SubVolume min_pos="100 -19.04999923706 -47.59999847412" max_pos="100 19.04999923706 47.59999847412" min_index="39505" max_index="173562" is_cropped="0" sub_folder=""/>
  <Source type="SOLVER"/>
</MetaResultFile>
