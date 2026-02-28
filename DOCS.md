# SmartHomeEntry Agent – Add-on dla Home Assistant

Zapewnia bezpieczny zdalny dostęp do Twojego Home Assistant przez szyfrowany tunel SSH.

## Instalacja

1. Dodaj repozytorium add-onów w Home Assistant:
   - **Supervisor → Add-on Store → ⋮ → Repositories**
   - Wklej URL: `https://github.com/szyderca84/SmartHomeEntry-HA-Addon-`

2. Znajdź **SmartHomeEntry Agent** na liście i kliknij **Install**.

3. Przejdź do zakładki **Configuration** i wklej:
   - `install_token` – token z panelu SmartHomeEntry (zakładka Integracje)
   - `api_url` – `https://api.smarthomeentry.com` (domyślna wartość)
   - `ha_port` – port Twojego HA (domyślnie `8123`)

4. Kliknij **Save**, a następnie **Start**.

5. Sprawdź zakładkę **Log** – powinieneś zobaczyć `Agent connected`.

## Konfiguracja

| Parametr        | Opis                                      | Domyślna wartość              |
|----------------|-------------------------------------------|-------------------------------|
| `install_token` | Token instalacyjny z panelu SHE           | *(wymagany)*                  |
| `api_url`       | URL API SmartHomeEntry                    | `https://api.smarthomeentry.com` |
| `ha_port`       | Port lokalnego Home Assistant             | `8123`                        |

## Rozwiązywanie problemów

- Upewnij się, że `install_token` jest wpisany poprawnie (bez spacji)
- Token wygasa po 15 minutach od wygenerowania – jeśli agent się nie połączy, wygeneruj nowy w panelu
- Sprawdź logi: **Supervisor → SmartHomeEntry Agent → Log**
