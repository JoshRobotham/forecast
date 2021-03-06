\name{seasonaldummy}
\alias{seasonaldummy}
\alias{seasonaldummyf}
\title{Seasonal dummy variables}
\usage{seasonaldummy(x,h)
}

\arguments{
\item{x}{Seasonal time series: a \code{ts} or a \code{msts} object}
\item{h}{Number of periods ahead to forecast (optional)}
}
\description{\code{seasonaldummy} returns a matrix of dummy variables suitable for use in \code{\link{Arima}}, \code{\link{auto.arima}} or \code{\link{tslm}}. The last season is omitted and used as the control.

\code{seasonaldummyf} is deprecated, instead use the \code{h} argument in \code{seasonaldummy}.
}

\details{The number of dummy variables is determined from the time series characteristics of \code{x}. When \code{h} is missing, the length of \code{x} also determines the number of rows for the matrix returned by \code{seasonaldummy}. the value of \code{h} determines the number of rows for the matrix returned by \code{seasonaldummy}, typically used for forecasting. The values within \code{x} are not used.
}

\value{Numerical matrix.}

\seealso{\code{\link{fourier}}}

\author{Rob J Hyndman}
\examples{
plot(ldeaths)

# Using seasonal dummy variables
month <- seasonaldummy(ldeaths)
deaths.lm  <- tslm(ldeaths ~ month)
tsdisplay(residuals(deaths.lm))
ldeaths.fcast <- forecast(deaths.lm,
    data.frame(month=I(seasonaldummy(ldeaths,36))))
plot(ldeaths.fcast)

# A simpler approach to seasonal dummy variables
deaths.lm  <- tslm(ldeaths ~ season)
ldeaths.fcast <- forecast(deaths.lm, h=36)
plot(ldeaths.fcast)

}
\keyword{ts}
