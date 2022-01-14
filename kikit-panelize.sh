rm -rf panel-output
mkdir panel-output

docker run  -w /kikit \
            -v $(pwd):/kikit \
            yaqwsx/kikit:nightly-m1 \
            kikit panelize -p kikit-panel-preset.json pixel-pump-mainboard.kicad_pcb panel-output/pixel-pump-mainboard-panel.kicad_pcb



