CREATE SEQUENCE IF NOT EXISTS seq_benchmark START 1;

CREATE TABLE IF NOT EXISTS benchmark (
    id INTEGER PRIMARY KEY DEFAULT nextval('seq_benchmark'),
    suite TEXT NOT NULL,
    db TEXT NOT NULL,
    operation TEXT NOT NULL,
    started_at TIMESTAMP NOT NULL,
    finished_at TIMESTAMP,
    deleted_at TIMESTAMP,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS metric (
    benchmark_id INTEGER REFERENCES benchmark(id),
    time TIMESTAMP NOT NULL,
    cpu_percent REAL NOT NULL,
    mem_mb INTEGER NOT NULL,
    disk_mb INTEGER NOT NULL
);


CREATE TYPE IF NOT EXISTS event_type AS ENUM ('start', 'end');

CREATE TABLE IF NOT EXISTS event (
    benchmark_id INTEGER REFERENCES benchmark(id),
    time TIMESTAMP NOT NULL,
    name TEXT NOT NULL,
    type event_type NOT NULL
);


CREATE SEQUENCE IF NOT EXISTS seq_debug START 1;

CREATE TABLE IF NOT EXISTS debug (
    id INTEGER PRIMARY KEY DEFAULT nextval('seq_debug'),
    content TEXT NOT NULL
);
