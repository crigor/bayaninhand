def copy_repository_cache
  info "~> Copying to #{c.release_path}"
  run("mkdir -p #{c.release_path} #{c.failed_release_dir} && rsync -aq #{c.exclusions} #{c.repository_cache}/ #{c.release_path}")

  info "~> Ensuring proper ownership."
  sudo("chown -R #{c.user}:#{c.group} #{c.release_path}")
end
