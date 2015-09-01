all: index.html Figs JS

Figs: Figs/intercross.png \
	  Figs/lodcurve_insulin.png \
	  Figs/many_boxplots.png \
	  Figs/pleiotropy_network.svg \
	  Figs/causal_network.svg \
	  Figs/multivariate.png \
	  Figs/multivariate2.png

JS: JS/manyboxplots.js JS/lod_and_effect.js JS/cistrans.js JS/lod_alltimes.js JS/corr_w_scatter.js JS/selection_example.js JS/lod_onetime_random.js JS/handle_stickies.js JS/org_automate.js JS/scale_of_results.js

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

Figs/%.svg: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web: index.html
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/

weball: index.html JS Figs
	scp *.html broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/
	scp JS/* broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/JS/
	scp Coffee/* broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/Coffee/
	scp CSS/* broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/CSS/
	scp Figs/*.png broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/Figs/
	scp Figs/*.jpg broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/Figs/
	scp Figs/*.svg broman-2.biostat.wisc.edu:public_html/presentations/Texas2015/Figs/

tar: index.html JS Figs
	cd ..;tar czvhf broman_htp.tgz Texas2015/[A-Za-z]*
