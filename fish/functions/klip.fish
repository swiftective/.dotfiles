function klip
  set n 0
  set f "I am the placeholder for each line in klipper"

  while test -n "$f"
    set f (qdbus org.kde.klipper /klipper getClipboardHistoryItem $n)
    echo "$f"
    set n (math $n + 1)
  end
end
