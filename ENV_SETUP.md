# Environment Setup
Generated: [date] | Last verified: [date] | Status: [DRAFT|CONFIGURED|VERIFIED]

## Runtime & Language
| Component     | Technology   | Version  | Source          |
|---------------|--------------|----------|-----------------|
| Language      | [from ADR]   | [exact]  | ADR-XXX         |
| Runtime       | [e.g. Node]  | [exact]  | ADR-XXX         |
| Package mgr   | [e.g. pnpm]  | [exact]  | ADR-XXX         |

## Services & Dependencies
| Service       | Purpose      | Hosted   | ADR             |
|---------------|--------------|----------|-----------------|
| [e.g. Postgres]| Primary DB  | [where]  | ADR-XXX         |
| [e.g. Redis]  | Cache/Queue  | [where]  | ADR-XXX         |

## Repository
| Item                  | Value              | Status  |
|-----------------------|--------------------|---------|
| Repo name             | [name]             | [ ]     |
| Visibility            | [public/private]   | [ ]     |
| Default branch        | dev                | [ ]     |
| Branch protection     | main requires PR   | [ ]     |

## CI/CD Pipeline
| Stage    | Tool         | Trigger              | Status  |
|----------|--------------|----------------------|---------|
| Lint     | [from ADR]   | push to dev, PR→main | [ ]     |
| Test     | [from ADR]   | push to dev, PR→main | [ ]     |
| Build    | [from ADR]   | push to dev, PR→main | [ ]     |
| Deploy   | [from ADR]   | Phase 6 only         | [ ]     |

## Secrets Required
| Secret Name           | Used By      | Where Configured     | Present |
|-----------------------|--------------|----------------------|---------|
| [SECRET_NAME]         | [service]    | [GitHub/local/.env]  | [ ]     |

Never store actual values here. Names and locations only.

## Environments
| Environment | Purpose      | URL/Host     | Config File    | Status  |
|-------------|--------------|--------------|----------------|---------|
| local       | Development  | localhost    | .env.local     | [ ]     |
| staging     | Pre-prod     | [URL]        | GitHub secrets | [ ]     |
| production  | Live         | [URL]        | GitHub secrets | [ ]     |

## Infrastructure
| Resource      | Provider     | IaC Tool     | Config File    | Status  |
|---------------|--------------|--------------|----------------|---------|
| [e.g. DB]     | [e.g. AWS]   | [Terraform]  | infra/main.tf  | [ ]     |

IaC config is generated and reviewed — never auto-applied.

## Verification Checklist
- [ ] CI pipeline passes on dev branch
- [ ] All secrets present and verified by name
- [ ] Branch protection active on main
- [ ] Project runs locally per README
- [ ] All environments reachable
- [ ] IaC config reviewed and approved

## Change Log
| Date    | Change                    | Phase    |
|---------|---------------------------|----------|
| [date]  | Initial generation        | Phase 2  |
| [date]  | Executed and verified     | Phase 3B |