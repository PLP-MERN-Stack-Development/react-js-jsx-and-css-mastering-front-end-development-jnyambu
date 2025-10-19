<#
deploy.ps1 - Build and deploy my-react-app to Netlify

Usage (recommended):
  # set these environment variables in your shell or CI
  $env:NETLIFY_AUTH_TOKEN = 'your_token'
  $env:NETLIFY_SITE_ID = 'your_site_id'
  ./deploy.ps1

Or run interactively:
  ./deploy.ps1 -SiteId "your_site_id"

#>
Param(
  [string]$SiteId = $env:NETLIFY_SITE_ID
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Write-Host "Building my-react-app..."
npm --prefix ./my-react-app run build

$dist = Join-Path -Path 'my-react-app' -ChildPath 'dist'
if (-not (Test-Path $dist)) {
  Write-Error "Build output not found at: $dist"
  exit 1
}

Write-Host "Checking for netlify CLI..."
if (-not (Get-Command netlify -ErrorAction SilentlyContinue)) {
  Write-Host "Netlify CLI not found. Installing globally (requires npm global install permissions)..."
  npm install -g netlify-cli
}

if (-not $env:NETLIFY_AUTH_TOKEN) {
  Write-Host "NETLIFY_AUTH_TOKEN not set. Opening `netlify login` for interactive browser login..."
  netlify login
} else {
  # ensure the CLI sees the token
  $env:NETLIFY_AUTH_TOKEN = $env:NETLIFY_AUTH_TOKEN
}

if (-not $SiteId) {
  Write-Host "No site id specified. Deploying interactively (you will be prompted to choose or create a site)."
  netlify deploy --dir=$dist --prod
} else {
  Write-Host "Deploying to Netlify site id: $SiteId"
  netlify deploy --dir=$dist --site=$SiteId --prod
}

Write-Host "Deploy step finished. Check the CLI output for the deploy URL or errors."
