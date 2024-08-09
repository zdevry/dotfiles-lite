set -gx EDITOR micro

set -gx MANPAGER "sh -c 'col -bx | bat -pl man'"
set -gx GROFF_NO_SGR 1

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
