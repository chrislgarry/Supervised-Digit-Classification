%% ESTIMATE LIKELIHOOD OF A PIXEL (x_pos,y_pos) BEING ON (255.5) IN EACH CLASS
function likelihoods = likeFromTraining(train_threes, train_fives, x_pos, y_pos)

    num_samples = size(train_threes, 3);

    threes_likelihood = 0;
    fives_likelihood = 0;

    for i = 1:num_samples

        current_five = train_fives(:,:,i);
        if current_five(x_pos, y_pos) == 255.5
            fives_likelihood = fives_likelihood+1;
        end
        
        current_three = train_threes(:,:,i);
        if current_three(x_pos, y_pos) == 255.5
            threes_likelihood = threes_likelihood+1;
        end

    end

    likelihoods = [threes_likelihood/num_samples; fives_likelihood/num_samples];

end