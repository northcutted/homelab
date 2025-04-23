# 🚀 Docker Compose Homelab Stack

![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker&style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

This repository contains a **Docker Compose configuration** for deploying a powerful and flexible homelab stack. The stack includes media services, monitoring tools, network services, and automation tools to supercharge your home server setup.

---

## 📦 Deployment Instructions

### 1️⃣ Clone the Repository
```bash
git clone <repository-url>
cd <repository-folder>
```

### 2️⃣ Set Environment Variables
Create a `.env` file in the root directory and define the required environment variables:
```env
PUID=1000
PGID=1000
TZ=America/New_York
DOCKERCONFDIR=/path/to/config
DOCKERSTORAGEDIR=/path/to/storage
PLEX_CLAIM=<your_plex_claim_token>
PLEX_ADVERTISE_IP=<your_advertise_ip>
CF_TOKEN=<your_cloudflare_token>
DOMAIN_NAME=<your_domain>
```

### 3️⃣ Start the Stack
```bash
docker-compose up -d
```

### 4️⃣ Verify Services
Check the status of the containers:
```bash
docker ps
```

---

## 🌟 Services Overview

### 🎥 Media Services
- **Plex**: Media server for streaming movies, TV shows, and music.
- **Radarr**: Movie management tool for downloading and organizing movies.
- **Sonarr**: TV show management tool for downloading and organizing TV series.
- **Bazarr**: Subtitle management tool for Radarr and Sonarr.
- **Prowlarr**: Indexer manager for Radarr, Sonarr, and other tools.
- **Overseerr**: Media request and discovery tool for Plex.
- **MeTube**: YouTube downloader for saving videos locally.

### 📊 Monitoring Services
- **Loki**: Log aggregation system.
- **Promtail**: Log collector for Loki.
- **Grafana**: Visualization and monitoring platform.
- **Prometheus**: Metrics collection and monitoring system.
- **Alertmanager**: Alerting system for Prometheus.
- **Node Exporter**: Host metrics exporter for Prometheus.
- **cAdvisor**: Container resource usage and performance monitoring.

### 🌐 Network Services
- **Cloudflared**: Secure tunnel to Cloudflare for exposing services.
- **Nginx Proxy Manager**: Reverse proxy manager with SSL support.

### 🤖 Automation Tools
- **n8n**: Workflow automation tool.

### 🛠️ Other Services
- **Watchtower**: Automatic container updates.
- **IT Tools**: Collection of IT utilities.

---

## 🖥️ Additional Stack: NAS Deployment

This repository also includes a **secondary stack** designed to run on a NAS. I do this so that the downloaders are closer to the disks.

### Deployment Instructions for NAS Stack

#### 1️⃣ Clone the Repository
```bash
git clone <repository-url>
cd <repository-folder>
```

#### 2️⃣ Set Environment Variables
Create a `.env` file in the root directory and define the required environment variables:
```env
PUID=1000
PGID=1000
TZ=America/New_York
DOCKERCONFDIR=/path/to/config
DOCKERSTORAGEDIR=/path/to/storage
NPM_DB_PASSWORD=<your_minio_password>
VPN_USER=<your_vpn_username>
VPN_PASS=<your_vpn_password>
LAN_NETWORK=<your_local_network>
```

#### 3️⃣ Start the NAS Stack
```bash
docker-compose -f docker-compose-nas.yml up -d
```

#### 4️⃣ Verify Services
Check the status of the containers:
```bash
docker ps
```

### NAS Stack Services Overview

#### 📊 Monitoring Services
- **cAdvisor**: Container resource usage and performance monitoring.
- **Node Exporter**: Host metrics exporter for Prometheus.

#### 🗄️ Storage Services
- **MinIO**: High-performance object storage server with S3 compatibility.

#### 📥 Download Services
- **SABnzbd**: Usenet downloader for managing NZB files.
- **Transmission with OpenVPN**: Torrent client with built-in VPN support for secure downloads.

---

## 🕸️ Networks

### Primary Stack Networks
- **docker**: Default bridge network for most services.
- **loki**: Dedicated network for logging services.
- **tunnel**: Network for Cloudflared.
- **dockervlan**: Macvlan network for assigning static IPs.

### NAS Stack Networks
- **docker**: Default bridge network for all services.

---

## 📝 Notes
- Ensure the required directories (`DOCKERCONFDIR` and `DOCKERSTORAGEDIR`) exist and have the correct permissions.
- Update the `.env` file with your specific configuration before deploying the stack.

---

## 🛠️ Troubleshooting
- Use `docker logs <container_name>` to view logs for a specific container.
- Check health status with:
  ```bash
  docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"
  ```

---

## 📜 License
This project is licensed under the MIT License.
