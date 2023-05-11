% Set the parameters which have the "Determined by studen" comment to tune
% the Kalman filter. Do not modify anything else in this file.

global Pinit Qgamma Qbeta mahaThreshold ;

% Uncertainty on initial position of the robot.

sigmaX     =10/3;         % Determined by student
sigmaY     = 5 ;         % Determined by student
sigmaTheta = 5*pi/180;     % Determined by student
sigmaRL    = 1 ; 
sigmaRR    = sigmaRL ;
Pinit = diag( [ sigmaX^2 sigmaY^2 sigmaTheta^2 ...
                sigmaRL^2 sigmaRR^2 ] ) ;


% Measurement noise.

meas_data = [37.52-21.01, 93.06-78.05, 147.09-135.08, 204.13-189.12, 261.17-243.16, 316.7-300.19, 372.24-355.73, 429.28-412.77];
estimated_range = (mean(meas_data)+3*std(meas_data)) ;
sigmaXmeasurement = sqrt(estimated_range^2/12) ;  % Determined by student
sigmaYmeasurement = sqrt(10^2/12) ;  % Determined by student
Qgamma = diag( [sigmaXmeasurement^2 sigmaYmeasurement^2] ) ;


% Input noise

sigmaTuning = 0.1 ; 
Qwheels = sigmaTuning^2 * eye(2) ;
Qbeta   = Qwheels ; 

% State noise
 
sigmaR = 0 ; 
Qalpha = [  zeros(3)    zeros(3,2)    ;
           zeros(2,3) sigmaR^2*eye(2) ] ;

% Mahalanobis distance threshold

mahaThreshold = sqrt(chi2inv(0.95, 2)) ;  % Determined by student
