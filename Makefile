all: index.html Figs JS

Figs: Figs/intercross.png Figs/lodcurve_insulin.png

JS: JS/manyboxplots.js JS/lod_and_effect.js JS/cistrans.js JS/lod_alltimes.js JS/corr_w_scatter.js JS/selection_example.js JS/lod_onetime_random.js JS/handle_stickies.js

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web: index.html
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/AAAS/

weball: index.html JS Figs
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/AAAS/
	scp JS/* broman-2.biostat.wisc.edu:public_html/presentations/AAAS/JS/
	scp Coffee/* broman-2.biostat.wisc.edu:public_html/presentations/AAAS/Coffee/
	scp CSS/* broman-2.biostat.wisc.edu:public_html/presentations/AAAS/CSS/
	scp Figs/*.png broman-2.biostat.wisc.edu:public_html/presentations/AAAS/Figs/
	scp Figs/*.jpg broman-2.biostat.wisc.edu:public_html/presentations/AAAS/Figs/
	scp Figs/Panels/* broman-2.biostat.wisc.edu:public_html/presentations/AAAS/Figs/Panels/
	scp Figs/Charts/* broman-2.biostat.wisc.edu:public_html/presentations/AAAS/Figs/Charts/

tar: index.html JS Figs
	cd ..;tar czvhf broman_aaas.tgz AAAS/[A-Za-z]*
