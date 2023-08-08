import { Inject, Injectable } from '@nestjs/common';
import { {{name.constantCase()}}_REPOSITORY, {{name.pascalCase()}}Repository } from '../../ports/{{name.paramCase()}}.repository';

@Injectable()
export class FindAll{{name.pascalCase()}}Usecase {
  constructor(
    @Inject({{name.constantCase()}}_REPOSITORY)
    private readonly {{name.camelCase()}}Repository: {{name.pascalCase()}}Repository,
  ) {}

  async execute() {
    return this.{{name.camelCase()}}Repository.findAll();
  }
}
