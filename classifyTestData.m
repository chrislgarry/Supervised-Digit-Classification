function results = classifyTestData(train_threes, train_fives, test_threes, test_fives, priors, pixel_coord)

    test_class_size = 50;
    total_test_size = 100;
    threes_results = 0;
    fives_results  = 0;
    
    likelihoods = likeFromTraining(train_threes, train_fives, pixel_coord(1), pixel_coord(2));
        
    for i = 1:test_class_size  
        
        % Test threes
        current_test_three = test_threes(:,:,i);
        feature_value = current_test_three(pixel_coord(1), pixel_coord(2));
        posteriors = BayesRule(feature_value, likelihoods, priors);
        [C, Class_Index] = max(posteriors);
        
        if Class_Index == 1
            threes_results = threes_results + 1;
        end

        % Test fives
        current_test_five = test_fives(:,:,i);
        feature_value = current_test_five(pixel_coord(1), pixel_coord(2)); 
        posteriors = BayesRule(feature_value, likelihoods, priors);
        
        [C, Class_Index] = max(posteriors);
        
        if Class_Index == 2
            fives_results = fives_results + 1;
        end
        
    end
    
    % Returns accuracy for all test predictions
    results = [threes_results/test_class_size; fives_results/test_class_size; (threes_results+fives_results)/total_test_size];
    
end