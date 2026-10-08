CREATE TABLE IF NOT EXISTS devices (
  id            SERIAL PRIMARY KEY,
  asset_tag     VARCHAR(50)  NOT NULL UNIQUE,
  name          VARCHAR(100) NOT NULL,
  type          VARCHAR(30)  NOT NULL
                CHECK (type IN ('chromebook', 'laptop', 'desktop', 'tablet', 'projector', 'printer', 'other')),
  brand         VARCHAR(50),
  model         VARCHAR(50),
  serial_number VARCHAR(100) UNIQUE,
  status        VARCHAR(20)  NOT NULL DEFAULT 'available'
                CHECK (status IN ('available', 'in_use', 'maintenance', 'retired')),
  location      VARCHAR(100),
  assigned_to   VARCHAR(100),
  purchase_date DATE,
  notes         TEXT,
  created_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);