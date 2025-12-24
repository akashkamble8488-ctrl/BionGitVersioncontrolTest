git_auto_commit <- function(
    branch = "main",
    push = TRUE,
    max_files = 5
) {
  # Check if git exists
  if (system("git rev-parse --is-inside-work-tree", ignore.stdout = TRUE, ignore.stderr = TRUE) != 0) {
    return(invisible())
  }
  
  status <- system("git status --porcelain", intern = TRUE)
  
  if (length(status) == 0) {
    return(invisible())
  }
  
  files <- substr(status, 4, nchar(status))
  short_list <- paste(head(files, max_files), collapse = ", ")
  suffix <- if (length(files) > max_files) " ..." else ""
  
  msg <- sprintf(
    "Auto update (%s): %s%s",
    format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
    short_list,
    suffix
  )
  
  system("git add .")
  system(sprintf('git commit -m "%s"', msg))
  
  if (push) {
    system(sprintf("git push origin %s", branch))
  }
}
