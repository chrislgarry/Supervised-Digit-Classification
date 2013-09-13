function posteriors = BayesRule(feature_value, likelihoods, priors)

% Bayes Rule for class 1 (3's) and class 2 (5's)

    posteriors = [0; 0];
    
    if feature_value == 0.5 % If pixel is off:
        
        prob_off = ((1-likelihoods(1))*priors(1)) + ((1-likelihoods(2))*priors(2));
        
        if prob_off == 0
            prob_off = 0.5;
        end
        
        % Class 1
        posteriors(1) = ((1-likelihoods(1))*priors(1))  /  prob_off;
        
        % Class 2
        posteriors(2) = ((1-likelihoods(2))*priors(2))  /  prob_off;
        
    else % Else pixel is on and:
        
        prob_on = ((likelihoods(1))*priors(1)) + ((likelihoods(2))*priors(2));
        
        if prob_on == 0
            prob_on = 0.5;
        end
        
        % Class 1
        posteriors(1) = (likelihoods(1)*priors(1))  /  prob_on;
        
        % Class 2
        posteriors(2) = (likelihoods(2)*priors(2))  /  prob_on;
        
    end

end