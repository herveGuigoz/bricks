import { Inject, Injectable } from '@nestjs/common';
import { RessourceDoesNotExist } from '@app/common';
import { {{name.constantCase()}}_REPOSITORY, {{name.pascalCase()}}Repository } from '../../ports/{{name.paramCase()}}.repository';

@Injectable()
export class FindOne{{name.pascalCase()}}Usecase {
  constructor(
    @Inject({{name.constantCase()}}_REPOSITORY)
    private readonly {{name.camelCase()}}Repository: {{name.pascalCase()}}Repository,
  ) {}

  async execute(id: string) {
    const instance = await this.{{name.camelCase()}}Repository.findOne(id);

    if (!instance) {
      throw new RessourceDoesNotExist();
    }

    return instance;
  }
}
