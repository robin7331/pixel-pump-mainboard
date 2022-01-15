rm -rf output
mkdir output

docker run  -w /kikit \
            -v $(pwd):/kikit \
            yaqwsx/kikit:nightly-m1 \
            kikit panelize -p kikit-panel-preset.json pixel-pump-mainboard.kicad_pcb output/pixel-pump-mainboard-panel.kicad_pcb

docker run  -w /kikit \
            -v $(pwd):/kikit \
            yaqwsx/kikit:nightly-m1 \
            kikit fab jlcpcb --no-drc output/pixel-pump-mainboard-panel.kicad_pcb output



