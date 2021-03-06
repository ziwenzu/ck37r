% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_roc.SuperLearner.R
\name{plot_roc.SuperLearner}
\alias{plot_roc.SuperLearner}
\title{Plot a ROC curve from cross-validated AUC from SuperLearner}
\usage{
\method{plot_roc}{SuperLearner}(
  x,
  y = x$Y,
  learner = NULL,
  title = "SuperLearner cross-validated ROC",
  subtitle = NULL,
  digits = 4,
  ...
)
}
\arguments{
\item{x}{SuperLearner object}

\item{y}{Outcome vector if not already included in the SL object.}

\item{learner}{Which learner to plot (numeric index or character string).
Defaults to minimum risk learner.}

\item{title}{Title to use in the plot.}

\item{subtitle}{TBD.}

\item{digits}{Digits to use when rounding AUC and CI for plot.}

\item{...}{Any additional unused arguments, due to the auc_table generic.}
}
\value{
List with plotted AUC & CI, table of AUC results for all learners,
      and the name of the best learner.
}
\description{
Plots the ROC curve for a single learner from a SuperLearner object,
defaulting to the minimum estimated risk learner. Based on code by Alan
Hubbard.
}
\examples{

library(SuperLearner)
library(ck37r)

data(Boston, package = "MASS")

set.seed(1)
sl = SuperLearner(Boston$chas, subset(Boston, select = -chas),
                  family = binomial(), SL.library = c("SL.mean", "SL.glm"),
                  cvControl = list(V = 2))

sl

plot_roc(sl, y = Boston$chas)

}
\references{
LeDell, E., Petersen, M., & van der Laan, M. (2015). Computationally
efficient confidence intervals for cross-validated area under the ROC curve
estimates. Electronic journal of statistics, 9(1), 1583.

Polley EC, van der Laan MJ (2010) Super Learner in Prediction. U.C. Berkeley
Division of Biostatistics Working Paper Series. Paper 226.
http://biostats.bepress.com/ucbbiostat/paper266/

Sing, T., Sander, O., Beerenwinkel, N., & Lengauer, T. (2005). ROCR:
visualizing classifier performance in R. Bioinformatics, 21(20), 3940-3941.

van der Laan, M. J., Polley, E. C. and Hubbard, A. E. (2007) Super Learner.
Statistical Applications of Genetics and Molecular Biology, 6, article 25.
http://www.degruyter.com/view/j/sagmb.2007.6.issue-1/sagmb.2007.6.1.1309/sagmb.2007.6.1.1309.xml
}
