## Cleaning the data

The data for all 3 studies is cleaned, Confidences are rescaled and the
data is merged into new dataframes.

Resulting in these two final dataframes:

<table>
<thead>
<tr>
<th style="text-align: right;">Subj_idx</th>
<th style="text-align: right;">Orig_idx</th>
<th style="text-align: left;">Study_id</th>
<th style="text-align: right;">Accuracy</th>
<th style="text-align: right;">Confidence</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">67</td>
<td style="text-align: right;">67</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">66.66667</td>
</tr>
<tr>
<td style="text-align: right;">67</td>
<td style="text-align: right;">67</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">75.00000</td>
</tr>
<tr>
<td style="text-align: right;">67</td>
<td style="text-align: right;">67</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">66.66667</td>
</tr>
<tr>
<td style="text-align: right;">67</td>
<td style="text-align: right;">67</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">58.33333</td>
</tr>
<tr>
<td style="text-align: right;">67</td>
<td style="text-align: right;">67</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">66.66667</td>
</tr>
<tr>
<td style="text-align: right;">67</td>
<td style="text-align: right;">67</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">58.33333</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th style="text-align: right;">Subj_idx</th>
<th style="text-align: right;">Orig_idx</th>
<th style="text-align: left;">Study_id</th>
<th style="text-align: right;">average_performance</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">67</td>
<td style="text-align: right;">67</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0.58</td>
</tr>
<tr>
<td style="text-align: right;">68</td>
<td style="text-align: right;">68</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0.66</td>
</tr>
<tr>
<td style="text-align: right;">69</td>
<td style="text-align: right;">69</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0.54</td>
</tr>
<tr>
<td style="text-align: right;">70</td>
<td style="text-align: right;">70</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0.70</td>
</tr>
<tr>
<td style="text-align: right;">71</td>
<td style="text-align: right;">71</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0.60</td>
</tr>
<tr>
<td style="text-align: right;">72</td>
<td style="text-align: right;">72</td>
<td style="text-align: left;">Massoni&amp;Roux</td>
<td style="text-align: right;">0.66</td>
</tr>
</tbody>
</table>

## Data visualization 1: Confidence ratings and performance accuracy across studies

Firstly, filter out all subjects that have only correct or only
incorrect responses.

    confidence_filtered <- confidence %>%
      group_by(Subj_idx) %>%
      filter(sum(Accuracy == 1) > 0, sum(Accuracy == 0) > 0) %>%
      ungroup()

Now the means per subject and study can be calculated:

    # in preperation for plotting, create txt labels
    confidence_filtered <- confidence_filtered %>%
      mutate(Label = ifelse(Accuracy == 1, "Correct", "Incorrect"))


    confidence_means_individual <- confidence_filtered %>%
      group_by(Subj_idx, Study_id, Label, Title) %>%
      summarise(mean_conf = mean(Confidence, na.rm = TRUE))


    confidence_means_group <- confidence_filtered %>%
      group_by(Study_id, Label, Title) %>%
      summarise(mean_conf = mean(Confidence, na.rm = TRUE))

Final plot:

    ggplot() +
      # individual lines
      geom_line(data = confidence_means_individual, 
                aes(x = Label, y = mean_conf, group = Subj_idx, color = Title), 
                alpha = 0.4) +  # slightly transparent to make group lines stand out more
      # individual points
      geom_point(data = confidence_means_individual, 
                 aes(x = Label, y = mean_conf, color = Title), 
                 alpha = 0.4,
                 size = 1) +
      # group lines
      geom_line(data = confidence_means_group, 
                aes(x = Label, y = mean_conf, group = Study_id, color = Title), 
                linewidth = 2) +
      # group points
      geom_point(data = confidence_means_group, 
                 aes(x = Label, y = mean_conf, color = Title), 
                 size = 3) +
      facet_wrap(~ Title) +  # panel for each study
      theme_minimal() +
      labs(
        title = "Confidence ratings by decision Accuracy across Studies",
        x = "",
        y = "Avg. Confidence",
      ) +
      theme(legend.position = "none") + 
      scale_color_manual(values = highcontrast(3))

![](ArminBurkhardt_files/figure-markdown_strict/viz-1-1.png)

## Data visualization 2: Performance accuracy across studies

This was very straightforward thanks to the amazing drawing provided.
The following plot shows where most participants fall in terms of their
average performance accuracy across the three studies (violin: actual
distribution of the data, boxplot: median and range, jitter: individual
data points spread out)

    ggplot(performance, aes(x = Title, y = average_performance, fill = Study_id)) +
      geom_violin(alpha = 0.5, trim = FALSE) +
      # boxplot with outliers hidden as jitter also shows them
      geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) +
      # each individual participants performance score (jittered as in the drawing)
      geom_jitter(width = 0.1, alpha = 1, size = 2, aes(fill = Study_id), color = "black", shape = 21) +
      theme_minimal() +
      labs(
        title = "Average performance accuracy across studies",
        x = "Study",
        y = "Performance Accuracy"
      ) +
      theme(legend.position = "none") +
      scale_fill_manual(values = highcontrast(3))

![](ArminBurkhardt_files/figure-markdown_strict/viz-2-1.png)

## Closing remarks

The data very much confirms that correct decisions usually have higher
confidence ratings than incorrect ones, as you stated in your
visualization 1 task, and its also interesting to see how well the
participants performed across the three studies!

Thank you for this interesting project and especially for the pretty
drawings, they helped a lot!
