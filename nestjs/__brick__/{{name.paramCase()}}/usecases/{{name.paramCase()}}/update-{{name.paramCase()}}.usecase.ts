import { Inject, Injectable } from '@nestjs/common';
import { RessourceDoesNotExist } from '@app/common';
import { {{name.constantCase()}}_REPOSITORY, {{name.pascalCase()}}Repository } from '../../ports/{{name.paramCase()}}.repository';

export class Update{{name.pascalCase()}}Command {
  id: string;
  name: string;
}

@Injectable()
export class Update{{name.pascalCase()}}Usecase {
  constructor(
    @Inject({{name.constantCase()}}_REPOSITORY)
    private readonly {{name.camelCase()}}Repository: {{name.pascalCase()}}Repository,
  ) {}

  async execute(command: Update{{name.pascalCase()}}Command) {
    const instance = await this.{{name.camelCase()}}Repository.findOne(command.id);

    if (!instance) {
      throw new RessourceDoesNotExist();
    }

    return this.{{name.camelCase()}}Repository.update(command.id, command.name);
  }
}
