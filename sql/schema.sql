DROP TABLE IF EXISTS song;
CREATE TABLE IF NOT EXISTS song (
  sid INTEGER NOT NULL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  composer TEXT NOT NULL
);

DROP TABLE IF EXISTS release;
CREATE TABLE IF NOT EXISTS release (
  rid INTEGER NOT NULL PRIMARY KEY,
  title TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('Album', 'Compilation', 'EP', 'Single'))
);

DROP TABLE IF EXISTS relationship;
CREATE TABLE IF NOT EXISTS relationship (
  rid INTEGER NOT NULL PRIMARY KEY,
  song_title TEXT,
  release_title TEXT NOT NULL,
  track_number TEXT,
  FOREIGN KEY(song_title) REFERENCES song(title),
  FOREIGN KEY(release_title) REFERENCES release(title)
);
