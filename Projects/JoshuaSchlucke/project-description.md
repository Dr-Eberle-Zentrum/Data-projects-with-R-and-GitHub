# Task description

Open-source projects use commit messages to communicate intent, fixes,
and changes. These short texts can reveal how teams work, how often they
fix bugs, and how practices differ across repositories and time. Your
task is to explore commit message styles and activity patterns across
popular GitHub projects.

## Questions / ideas

- How do commit volumes vary by weekday and hour, and do different
  repositories show distinct rhythms?
- How common are conventional commit prefixes (`feat`, `fix`, `docs`,
  `refactor`, `test`, etc.), and how do these proportions change over
  time?
- Are message lengths and formats different across repositories or
  commit types?
- Which repositories show more maintenance activity (fix/docs/chore)
  versus feature activity (feat)?

## Data

The original dataset contains commit messages and metadata from 34
popular GitHub repositories (e.g., `tensorflow/tensorflow`,
`pytorch/pytorch`, `pandas-dev/pandas`) as of April 21, 2021. Source:
<https://www.kaggle.com/datasets/dhruvildave/github-commit-messages-dataset/data>.
The repository list is saved in `datasets/source_README.md`.

Use one of the smaller subsets provided in `datasets/`:

- `datasets/commits_sample_50k.csv` (random 50,000 rows, ~28 MB) — quick
  prototyping.
- `datasets/commits_sample_150k.csv.zip` (random 150,000 rows, ~31 MB,
  zipped) — larger sample that stays under GitHub’s file size limit.
- `datasets/commits_balanced_3k_per_repo.csv` (~48 MB) — balanced sample
  with 3,000 commits per repo for fair repo comparison.
- Raw commit-level files for three repos (large/medium/small) to build a
  GitHub-style “commit calendar” heatmap. The repos are `torvalds/linux`
  (large), `pytorch/pytorch` (medium), and `tidyverse/ggplot2` (small).
  - `datasets/commits_2019_2020_torvalds_linux.csv.zip` (~42 MB, zipped)
  - `datasets/commits_2019_2020_pytorch_pytorch.csv` (~13 MB)
  - `datasets/commits_2019_2020_tidyverse_ggplot2.csv` (~0.1 MB)

### Column overview

The CSV has the following columns:

- `commit`: commit hash
- `author`: author name and email in one string (e.g., `Name <email>`)
- `date`: commit date as a string with timezone
- `message`: commit message text (may include commas or line breaks)
- `repo`: repository in `owner/name` format

### First rows (from `commits_sample_50k.csv`)

### Loading zipped CSVs in R

If a file is zipped (`.csv.zip`), you can read it directly without
extracting:

    # Example: read the 150k sample from the ZIP file
    read.csv(unz("datasets/commits_sample_150k.csv.zip", "commits_sample_150k.csv"))

## Data cleaning / manipulation goals

1.  **Split and standardize columns**
    - Separate `author` into `author_name` and `author_email`.
    - Parse `date` into a proper datetime column and derive `year`,
      `month`, `weekday`, and `hour`.
    - Verify that `commit` is unique; drop duplicates if necessary.
2.  **Message parsing**
    - Normalize message text (trim whitespace, handle casing where
      needed).
    - Detect conventional commit prefixes (`feat`, `fix`, `docs`,
      `refactor`, `test`, `chore`, `style`, `build`, `ci`, `perf`) and
      label everything else as `other`.
    - Extract references to issues/PRs (e.g., `#1234`).
3.  **Filtering and validation**
    - Flag or remove auto-generated messages (e.g., “Merge”, “Bump”,
      “Revert”).
    - Check for missing author/email/date fields and summarize
      completeness per repo.

## Visualization goals

- **Temporal heatmap**: commits by weekday (rows) and hour (columns),
  overall and per repo.
- **Message-type comparison**: stacked bar chart of commit types by repo
  (normalized to 100%).
- **Message length comparison**: boxplots of message length by repo or
  by commit type.
- **Optional trend**: monthly time series of commit types for 2–3
  selected repos.
- **Optional “commit calendar”**: 7x53 daily heatmap (like GitHub’s
  contribution graph) for 2019 and 2020 using
  `commits_3repos_2019_2020_daily.csv`.

## Expected outcome

A cleaned, tidy dataset with derived time and message-type features,
plus 2–3 visualizations that highlight how development patterns differ
across major open-source repositories.
