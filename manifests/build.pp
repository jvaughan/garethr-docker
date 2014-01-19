# == Define: docker:build
#
# A define which builds a docker image from a dockerfile
#
define docker::build(
  $image          = $title,
  $image_tag      = undef,
  $dockerfile_dir = undef
) {

  if $image_tag {
    $image_build = "docker build -t ${image}:${image_tag} ."
  }
  else {
    $image_build = "docker build -t ${image} ."
  }

  exec { $image_build:
    path    => ['/bin', '/usr/bin'],
    cwd     => $dockerfile_dir
  }
}