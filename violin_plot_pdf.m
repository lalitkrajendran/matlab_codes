function violins = violin_plot_pdf(x, bins, labels, colors)
    % number of data points on each plot
    num_data = size(x, 1);
    % number of violins to plot
    num_violins = size(x, 2);
    % number of bins
    num_bins = numel(bins);
    % max width of the violin
    % w = 1./(2*num_violins) * 3;
    w = 0.3;
    
    y1 = nans(num_violins, 1);
    y2 = nans(num_violins, 1);
    % p = nans(num_violins, numel(bins)-1);
    p = cell(num_violins, 1);
    edges = cell(num_violins, 1);
    quartiles = nans(num_violins, 3);

    % calculate statistics    
    for violin_index = 1:num_violins
        data = x(:, violin_index);
        % calculate pdf
        % [p(violin_index, :), edges] = histcounts(data, bins, 'normalization', 'pdf');
        [p{violin_index}, edges{violin_index}] = histcounts(data, 'normalization', 'pdf');
        
        % calculate quartiles
        quartiles(violin_index, :) = quantile(data, [0.25, 0.5, 0.75]);
        IQR = quartiles(violin_index, 3) - quartiles(violin_index, 1);
        
        % calculate whiskers
        lowhisker = quartiles(violin_index, 1) - 1.5*IQR;
        lowhisker = max(lowhisker, min(data(data > lowhisker)));
        hiwhisker = quartiles(violin_index, 3) + 1.5*IQR;
        hiwhisker = min(hiwhisker, max(data(data < hiwhisker)));
    
        % calculate limits
        y1(violin_index) = lowhisker;
        y2(violin_index) = hiwhisker;        
    end

    % edges = edges(1:end-1);
    % edges = bins(2:end);

    % plot the violin
    for violin_index = 1:num_violins
        % scale pdf
        % p(violin_index, :) = p(violin_index, :) / max(p(violin_index, :)) * w;
        p{violin_index} = p{violin_index} / max(p{violin_index}) * w;
        
        % violin position
        pos = violin_index;
        % x co-ordinates
        % X = [pos + p(violin_index, :), pos - p(violin_index, end:-1:1)];
        X = [pos + p{violin_index}, pos - p{violin_index}(end:-1:1)];
        % y co-ordinates
        % Y = [edges, edges(end:-1:1)];
        Y = [edges{violin_index}(1:end-1), edges{violin_index}(end-1:-1:1)];
        % plot violin
        violins(violin_index) = fill(X, Y, [1, 1, 1]);
        hold on
        
        % plot center line        
        plot([pos, pos], [y1(violin_index), y2(violin_index)], 'color', colors(violin_index, :))        
        
        % adjust violin properties 
        violins(violin_index).FaceColor = colors(violin_index, :);
        violins(violin_index).EdgeColor = [1, 1, 1];
        violins(violin_index).FaceAlpha = 0.5;

        % plot the median
        scatter(pos, quartiles(violin_index, 2), [], [1 1 1], 'filled', 'markeredgecolor', colors(violin_index, :));

        % plot the quartiles
        scatter(pos, quartiles(violin_index, 1), [], [1 1 1], 'filled', '^', 'markeredgecolor', colors(violin_index, :));
        scatter(pos, quartiles(violin_index, 3), [], [1 1 1], 'filled', 'v', 'markeredgecolor', colors(violin_index, :));
    end
    
    box off
    xlim([0.5 num_violins + 0.5])
    ylim([0, bins(end)])
    xticks(1:num_violins);
    xticklabels(labels);
    
    % pause(0.1);
    % % turn off x axis line
    % ax = gca;
    % ax.XAxis.Axle.Visible = 'off';
    % ax.XAxis.TickLength = [0 0];
    % % turn off y axis line
    % ax.YAxis.Axle.Visible = 'off';
    % % ax.YAxis.TickLength = [0, 0];
    % ax.YAxis.TickLength = [0.005 0.005];
end