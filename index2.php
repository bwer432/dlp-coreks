<?php
  echo getenv("GREETING") . " " . gethostname() . " at " . ['SERVER_ADDR'] . " back to " . ['REMOTE_ADDR'] . "\n";
?>
