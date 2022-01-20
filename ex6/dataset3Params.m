function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

arr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; 
first = true; 
for i = 1:length(arr)
    C_tmp = arr(i); 
    for j = 1:length(arr)
        sigma_tmp = arr(j); 
        model = svmTrain(X, y, C_tmp, @(x1, x2)gaussianKernel(x1, x2, sigma_tmp));
        
        pred = svmPredict(model, Xval); 

        err_tmp = mean(double(pred ~= yval)); 
        if first == true 
            err = err_tmp; 
            C = C_tmp; 
            sigma = sigma_tmp; 
            first = false; 
        else 
            if err_tmp < err 
                err = err_tmp; 
                C = C_tmp;
                sigma = sigma_tmp; 
            end 
        end 
    end 
end 





% =========================================================================

end
