# i3 notes

## Tasks
- [ ] Do not display, wifi, ethernet or vpn as fallback
- [/] List gui program i can launch to set some stuf
- [ ] Move i3 config in ~/.config? And create a dedicated script to deploy it

## How to launch
- pamac `pamac-manager` but need `sudo` so…

## How to manage

### Network

#### WIFI
`nmtui` and responsd to the UI
Works for connexion but don't save the pass

Solution was the share on other session the wifi pass for all users

##### Debugging
`journalctl -f -u NetworkManager`
