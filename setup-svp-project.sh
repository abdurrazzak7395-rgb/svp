# setup-svp-project.ps1
# Run: powershell -ExecutionPolicy Bypass -File .\setup-svp-project.ps1

$ErrorActionPreference = 'Stop'

Write-Host 'Creating SVP International Complete Project...'

# ============================================
# CREATE MAIN PROJECT DIRECTORY
# ============================================
$root = Join-Path (Get-Location) 'svp-international'
New-Item -ItemType Directory -Path $root -Force | Out-Null

# ============================================
# BACKEND (Rails API)
# ============================================
$backendDirs = @(
  'backend\app\controllers\api\v1',
  'backend\app\controllers\concerns',
  'backend\app\models',
  'backend\app\serializers',
  'backend\app\services',
  'backend\app\mailers',
  'backend\app\channels',
  'backend\app\jobs',
  'backend\config\initializers',
  'backend\config\environments',
  'backend\db\migrate',
  'backend\lib',
  'backend\spec'
)

# ============================================
# FRONTEND (Vue.js SPA)
# ============================================
$frontendDirs = @(
  'frontend\public',
  'frontend\src\assets\styles',
  'frontend\src\assets\images',
  'frontend\src\components\layout',
  'frontend\src\components\common',
  'frontend\src\components\auth',
  'frontend\src\components\appointments',
  'frontend\src\components\applications',
  'frontend\src\components\certificates',
  'frontend\src\components\payment',
  'frontend\src\router',
  'frontend\src\store\modules',
  'frontend\src\services',
  'frontend\src\utils',
  'frontend\src\views\auth',
  'frontend\src\views\dashboard',
  'frontend\src\views\appointments',
  'frontend\src\views\applications',
  'frontend\src\views\certificates',
  'frontend\src\views\payment',
  'frontend\src\views\profile'
)

foreach ($dir in ($backendDirs + $frontendDirs)) {
  New-Item -ItemType Directory -Path (Join-Path $root $dir) -Force | Out-Null
}

Write-Host 'Directory structure created!'
Write-Host ("Project location: {0}" -f $root)
