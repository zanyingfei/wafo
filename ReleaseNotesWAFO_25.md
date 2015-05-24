# Introduction #

The WAFO version 2.5 release includes many new functions and refactorings of old functions. Many functions are now distributed under the
GNU LESSER GENERAL PUBLIC LICENSE.

The details are given below:


# Details #
## Refactorings ##

  * XXXpdf, XXXcdf, XXXrnd, XXXinv, XXXfit, XXXplot renamed to pdfXXX, cdfXXX, rndXXX, invXXX fitXXX, plotXXX, respectively.
  * XXXstat renamed to momXXX
  * fitXXX now returns a structure instead of a vector.
  * All pdfXXX, cdfXXX, invXXX, momXXX now accepts a structure as returned from fitXXX functions.
  * All momXXX functions return mean, std, skewness and kurtosis.
  * iqr      renamed to iqrange
  * identify renamed to clickslct
  * whisto   renamed to histgrm
  * mle      renamed to mlest
  * empdistr renamed to plotedf
  * cempdistr renamed to plotedfcnd
  * wskewness renamed to skew
  * wkurtosis renamed to kurt
  * wquantile renamed to percentile

## New directories added ##
  * GRAPHUTIL : many useful plot functions
  * NUMDIFFTOOLS : tools for automatic numerical differentiation of functions
  * POLYUTIL : tools for evaluating polynomials.

## New functions: ##

Spectrum estimation:
All translated from Octave (GPL).
  * welch\_psd
  * welch\_psd2
  * welch\_cpsd

Distribution functions:
  * poisson,
  * cauchy,
  * hypergeometric,

Profile log likelihood functions:
  * lnkexp       - Link for x,F and parameters of Exponential distribution
  * lnkgenpar    - Link for x,F and parameters of Generalized Pareto distribution
  * lnkgev       - Link for x,F and parameters of Generalized Extreme value distribution
  * lnkgumb      - Link for x,F and parameters of Gumbel distribution
  * lnkgumbtrnc  - Link for x,F and parameters of truncated Gumbel distribution
  * lnkray       - Link for x,F and parameters of Rayleigh distribution
  * lnkweib      - Link for x,F and parameters of the Weibull distribution
  * logps        - Moran's negative log Product Spacings statistic
  * ciproflog    - Confidence Interval using Profile Log- likelihood or Product Spacing- function.
  * proflog           - Profile Log- likelihood or Product Spacing-function.
  * FINDCIPROFLOG     - Find Confidence Interval from proflog function

Statistics functions:
  * decluster         - Decluster peaks over threshold values
  * extremalidx       - Extremal Index measuring the dependence of data
  * findpot           - Find indices to Peaks over threshold values
  * prb2retper        - Return period from Probability of exceedance.
  * retper2prb        - Probability of exceedance from return period.

  * fitgenparrange    - Parameter estimates for GPD model vs thresholds
  * disprsnidx        - Dispersion Index vs threshold
  * reslife           - Mean Residual Life, i.e., mean excesses vs thresholds
  * plotdisprsnidx    - Plot Dispersion Index vs thresholds
  * plotreslife       - Plot Mean Residual Life (mean excess vs thresholds)

  * logit             - Logit function.
  * logitinv          - Inverse logit function.
  * regglm            - Generalized Linear Model regression
  * reglm             - Fit multiple Linear Regression Model.
  * reglogit          - Fit ordinal logistic regression model.
  * regnonlm          - Non-Linear Model Regression
  * regsteplm         - Stepwise predictor subset selection for Linear Model regression

  * princomp          -  Compute principal components of X

  * ranktrf           - Rank transformation of data material.
  * spearman          - Spearman's rank correlation coefficient.
  * var2corr          - Variance matrix to correlation matrix conversion.
  * lmoment           - L-moment based on order statistics.
  * pdfdiscrete       - Discrete PDF
  * pdfempirical      - Empirical pdf
  * cdfdiscrete       - Discrete cdf
  * cdfempirical      - Empirical cdf
  * invdiscrete       - Disrete quantile
  * invempirical      - Empirical quantile.

  * plotbox           - Plot box-and-whisker diagram
  * plotdensity       - Plot density.
  * plotfitsumry      - Plot diagnostic of fit to data

  * anovan            - multi-way analysis of variance (ANOVA)
  * testgumb          - Tests if shape parameter in a GEV is equal to zero
  * testmean1boot     - Bootstrap t-test for the mean equal to 0.
  * testmean1n        - Test for mean equals 0 using one-sample T-test
  * testmean2n        - Two-sample t-test for mean(x) equals mean(y)
  * testmean1r        - Wilcoxon signed rank test for H0: mean(x) equals 0.
  * testmean2r        - Wilcoxon rank-sum test for H0: mean(x) equals mean(y).

> Confidence interval estimation
    * ciboot            - Bootstrap confidence interval.
    * ciquant           - Nonparametric confidence interval for quantile
    * momci1b           - Moment confidence intervals using Bootstrap

> Bootstrap & jacknife estimates
    * covboot           - Bootstrap estimate of the variance of a parameter estimate.
    * covjack           - Jackknife estimate of the variance of a parameter estimate.
    * stdboot           - Bootstrap estimate of the parameter standard deviation.
    * stdjack           - Jackknife estimate of the standard deviation of a parameter

## Files distributed under LGPL ##
The following files of WAFO are distributed under the
GNU LESSER GENERAL PUBLIC LICENSE; either version 3 of the License, or
(at your option) any later version.

### Graphutil ###

black
clevels
cltext
epcolor
fcolorbar
figXXXX.m
plotfill
tallibing
tallibing3
vtkwrite
wafostamp
mayaplot

### Kdetools ###
bincount
chi2gof
chi2gof2
deriv
deriv2
evalpdf
fftce
gridcount
hXXX.m
kde.m
kde1dgui.m
kde2dgui.m
kdebin
kdedemo1
kdedemo2
kdefun
kdeoptset
kernelstats
mkernel
mkernel2
mkernelrnd
pdfstat
qlevels
qlevels2
sample
ssample
vsph



### Misc ###

betaloge
binom.m
ccquad
comnsize
findpeaks.m
genchol
geth1line
getshipchar.m
gravity.m
hypgf.m
iscomnsize
ismatlab
isoctave
levels
loaddata
mkcontents.m
parent.m
parseoptions.m
simpson.m
sinc.m
smooth.m
wafoversion.m
wdensity.m
where


### Multidim ###
dat2dspec.m
dspec2spreading.m
sensortypeid.m
sensortype.m
specoptset.m
testmeasurements

bfsspec.m
getcrosspectra.m
hwestimate.m
imlm.m
memfun.m
mlm.m
normspfn.m

### Numdifftols ###
derivest.m
directionaldiff.m
gradest
hessdiag
hessian
jacobianest

### Onedim ###
bartlett
covplot.m
dat2cor
dat2cov
dat2crossind
dat2crossind.m
dat2lc.m
dat2spec
dat2spec2
dat2steep.m
dat2tc.m
dat2tp.m
dat2wa.m
detrendma.m
ecross.m
findcross.m
findextrema.m
findoutliers
findrfc.m
hanning
hs2sign.m
lcplot.m
mm2lc.m
parzen
plotlc
reconstruct.m
spwaveplot.m
waveplot.m
vc2sign.m

### Polyutil ###
poly2hstr
poly2str
polyadd
polydiv
polyint
polyishft
polymul
polynder
polynint
polypow
polyreloc
polyrescl
polyshft
polysub
polytrim


### Simtools ###
cov2csdat.m
cov2sdat.m
disufq.m
disufq.c
duffsim.m
lc2sdat.m
seamovie.m
seasim.m
spec2linspec.m
spec2nlsdat.m
spec2sdat.m

### Spec ###
bretschneider.m
cov2spec.m
covinterp
createcov
createspec
demospec
dspec2char
getjonswappeakedness.m
getjonswapseastate.m
jonswap.m
k2w
lagtype
mccormick.m
mkbretschneider.m
mkdspec
mkjonswap.m
mkochihubble.m
mkspreading.m
mktmaspec.m
mktorsethaugen.m
normpsec
ochihubble.m
ohspec.m
ohspec3.m
oscspec.m
phi1.m
plotspec
pmspec.m
rotspec
scalespec
spec2bw
spec2char
spec2cov
spec2cov2
spec2dt
spec2mom
spec2spec
specinterp
specnorm
specplot
specscale
spreading
tmaspec.m
torsethaugen.m
ttspec
w2k.m
wallop.m

### Statistics ###
alias
bd0
cdfbeta
cdfbin
cdfcauchy
cdfchi2
cdfexp
cdff
cdffrech
cdfgam
cdfgengam
cdfgengammod
cdfgenpar
cdfgev
cdfgumb
cdfhyge
cdfinvnorm
cdflognorm
cdfmarg2d
cdfmargcnd2d
cdfmargcnd2dfun
cdfnorm
cdfpois
cdfray
cdfraymod
cdft
cdfweib
cdfwei2d
cdfweibmod
cdr
center
ciboot
ciproflog
ciquant
cl2cnr
clickslct
cnr2cl
comnsize
covboot
covjack
createfdata
decluster
demofitgenpar
dgammainc
edf
edfcnd
exptresh
extremalidx
extremalidxrange
ffd
findciproflog
findpot
fitbeta
fitchi2
fitexp
fitgam
fitgengam
fitgenpar
fitgenparml
fitgenparrange
fitgenparrangepos
fitgev
fitgumb
fitinvnorm
fitlognorm
fitmarg2d
fitmargcnd2d
fitmodel
fitnorm
fitray
fitraymod
fitt
fitweib
fitweib2d
fitweib3
fitweibmod
gammaincln
genpartresh
getdistname
getmodel
hill
histgrm
invbeta
invbin
invcauchy
invchi2
invcmarg2d
invcweib2d
invexp
invf
invfrech
invgam
invgengam
invgengammod
invgenpar
invgev
invgumb
invhyge
invinvnorm
invlognorm
invnorm
invray
invraymod
invt
invweib
invweibmod
iqrange
kurt
likgenpar
likweib2d
lmoment
lnkexp
lnkgenpar
lnkgev
lnkgumb
lnkgumbtrnc
lnkray
lnkweib
log1pxdx
logit
logitinv
loglike
logps
margcnd2dsmfun
margcnd2dsmfun2
mlest
mombeta
mombin
momci1b
momexp
momf
momfrech
momgam
momgengam
momgenpar
momgev
momgumb
momhyge
mominvnorm
momlognorm
mommarg2d
mommargcnd2d
momnorm
mompois
momray
momt
momweib
momweib2d
nplot
parsestatsinput
pdfbeta
pdfbin
pdfexp
pdff
pdffrech
pdfgam
pdfgengam
pdfgengammod
pdfgev
pdfgumb
pdfhyge
pdfinvnorm
pdflognorm
pdfmarg2d
pdfnorm
pdfpois
pdfray
pdfraymod
pdft
pdfweib
pdfweib2d
pdfweibmod
percentile
plotdensity
plotedf
plotedfcnd
plotexp
plotfitsumry
plotgumb
plotkde
plotmarg2dcdf
plotmarg2dmom
plotmargcnd2dcdf
plotmargcnd2dfit
plotmargcnd2dmom
plotnorm
plotqq
plotray
plotres\_skewkurt
plotreslife
plotresponse
plotresprb
plotresq
plotscatr
plotweib
plotweib2dcdf
plotweib2dmom
prb2retper
prbmargcnd2d
prbweib2d
proflog
range
ranktrf
regsteplm
res\_skewkurt
reslife
retper2prb
rndalpha
rndbeta
rndbin
rndboot
rndchi2
rndf
rndgam
rndgengam
rndgengammod
rndgenpar
rndgev
rndgumb
rndhyge
rndinvnorm
rndlognorm
rndmarg2d
rndmargcnd2d
rndnorm
rndnormnd
rndpois
rndray
rndraymod
rndt
rndweib
rndweib2d
rndweibmod
rstrrep
ryates
skew
spearman
stdboot
stdize
stdjack
sudg
testgumb
testmean1boot
testmean1n
testmean1r
testmean2n
testmean2r
var2corr
yates
### Wavemodels ###
b04jpdf.m
b04jpdf2.m
b04pdf.m
b04pdf2.m
bmr00pdf.m
bmr00pdf2.m
braylpdf.m
cav76pdf.m
jhspdf.m
jhspdf2.m
jhsnlpdf.m
jhsnlpdf2.m
jhvnlpdf.m
jhvnlpdf2.m
jhvpdf.m
jhvpdf2.m
lh83pdf.m
ltwcpdf.m
mk87pdf.m
mk87pdf2.m
ochi98pdf.m
ohhpdf.m
ohhspdf.m
ohhspdf2.m
ohhsspdf.m
ohhsspdf2.m
ohhvpdf.m
tay81pdf.m
tay90pdf.m
thpdf.m
thsnlpdf2.m
thsnlpdf.m
thspdf.m
thspdf2.m
thsspdf.m
thsspdf2.m
thvpdf.m
thvpdf2.m
trraylpdf.m


b04cdf.m
b04jcdf.m
bmr00cdf.m
braylcdf.m
jhscdf.m
jhsnlcdf.m
jhvcdf.m
jhvnlcdf.m
mk87cdf.m
ochi98cdf.m
ohhcdf.m
ohhscdf.m
ohhsscdf.m
tay81cdf.m
tay90cdf.m
thcdf.m
thscdf.m
thsnlcdf.m
thsscdf.m
thvcdf.m

mk87rnd.m
braylfit.m
ochi98fit.m

jhwparfun.m
jhnlwparfun.m
ohhgparfun.m
tay81fun.m
tay90fun.m
thgparfun.m
thwparfun.m