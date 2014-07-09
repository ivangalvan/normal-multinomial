require(compositions)

## Es carrega la funció per generar normals-multinomials
source('R/definition.R')

#Paramatres 
N = 100
Mu = c(2, 0)
Sigma = matrix(c(1, 0.75,
                 0.75, 1), nrow=2) * 0.2
Size = 100

## Plot de la distribució normal
par(mfrow=c(1,2))
plot.acomp(cbind(exp(rmvnorm(N, Mu, Sigma)), 1))
plot.acomp(rnorm.multinom(N, Mu, Sigma, Size))
par(mfrow=c(1,1))


# Comptar combinacions de la normal multinomial
# sort( table(apply(rnorm.multinom(N, Mu, Sigma, Size), 1, function(r) paste(r, collapse='-'))), decreasing=TRUE )
