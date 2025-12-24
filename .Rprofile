if (interactive() && requireNamespace("rstudioapi", quietly = TRUE)) {
  rstudioapi::registerCommandCallback(function(command_id) {
    if (command_id %in% c("executeCode", "executeAllCode")) {
      source("R/it_auto_commit.R", local = TRUE)
      git_auto_commit()
    }
  })
}
