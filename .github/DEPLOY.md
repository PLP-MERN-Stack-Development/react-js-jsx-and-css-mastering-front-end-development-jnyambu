Deployment targets and CI/CD snippets

This repository contains a Vite React app in `my-react-app`. The production build output is placed into `my-react-app/dist` by `npm --prefix ./my-react-app run build`.

1) GitHub Pages (workflow included)
- The repository already contains `.github/workflows/gh-pages-deploy.yml` which:
  - runs on push to `main`
  - installs app dependencies
  - runs the build
  - publishes `my-react-app/dist` to the `gh-pages` branch using `peaceiris/actions-gh-pages`

How to use:
- Push to `main`. The GitHub Action will populate the `gh-pages` branch automatically.
- In the repository settings -> Pages, set the source to `gh-pages` branch (root).

2) Netlify (recommended for simple deployments)
- Option A: Manual drag-and-drop
  - Build locally: `npm --prefix ./my-react-app run build`
  - Drag `my-react-app/dist` to Netlify's Sites -> New site -> Drag and drop

- Option B: Connect repo (recommended)
  - Connect your GitHub repo in Netlify.
  - Build command: `npm --prefix ./my-react-app run build`
  - Publish directory: `my-react-app/dist`

3) Vercel
- Import the repository into Vercel.
- Set the root to `my-react-app` (or let Vercel auto-detect).
- Build command: `npm run build`
- Output directory: `dist`

CI notes and secrets
- Netlify: you can use Netlify's GitHub integration and provide build command + publish directory. No extra repo secrets are required for basic deployments.
- Vercel: integrate with GitHub and set the project root to `my-react-app`.
- GitHub Actions: the included workflow uses the built-in `GITHUB_TOKEN` (no extra secrets required) to push to `gh-pages`.

Netlify GitHub Action (included)
- This repository also includes `.github/workflows/netlify-deploy.yml`. It does the following:
  - installs dependencies: `npm --prefix ./my-react-app install`
  - builds the app: `npm --prefix ./my-react-app run build`
  - uses the Netlify CLI to deploy `my-react-app/dist` to your configured Netlify site

Required repository secrets (Settings -> Secrets -> Actions):
- `NETLIFY_AUTH_TOKEN` — create from Netlify UI: User menu → Applications → Personal access tokens → New access token
- `NETLIFY_SITE_ID` — find in Site settings → Site information → Site ID (or from Netlify site dashboard URL)

Usage:
- Add the two secrets to your GitHub repository.
- Push to `main`. The `netlify-deploy` workflow will run and deploy to the configured Netlify site.

If you'd like a Vercel Action instead (requires Vercel token), tell me and I will add a `vercel-deploy.yml` and list the secret name to set.
