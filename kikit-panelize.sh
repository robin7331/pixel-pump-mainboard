rm -rf output
mkdir output

variable=`docker run yaqwsx/kikit:nightly-m1 --version`
echo "Using $variable"

echo "Panelizing"
docker run  -v $(pwd):/kikit \
            yaqwsx/kikit:nightly-m1 \
            panelize -p kikit-panel-preset.json \
            pixel-pump-mainboard.kicad_pcb \
            output/pixel-pump-mainboard-panel.kicad_pcb

echo "Generating JLCPCB fab files"
docker run  -v $(pwd):/kikit \
            yaqwsx/kikit:nightly-m1 \
            fab jlcpcb --no-drc \
            output/pixel-pump-mainboard-panel.kicad_pcb \
            output



echo "Rendering the PCB Front side"
docker run -v $(pwd):/kikit --entrypoint pcbdraw yaqwsx/kikit:nightly-m1 plot --no-components --style jlcpcb-green-enig pixel-pump-mainboard.kicad_pcb media/pixel-pump-mainboard-front.svg

echo "Rendering the PCB Back Side"
docker run -v $(pwd):/kikit --entrypoint pcbdraw yaqwsx/kikit:nightly-m1 plot --side back --no-components --style jlcpcb-green-enig pixel-pump-mainboard.kicad_pcb media/pixel-pump-mainboard-back.svg

echo "DONE!"

