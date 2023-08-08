import { Inject, Injectable } from '@nestjs/common';
import { RessourceDoesNotExist } from '@app/common';
import { {{name.constantCase()}}_REPOSITORY, {{name.pascalCase()}}Repository } from '../../ports/{{name.paramCase()}}.repository';

export class Delete{{name.pascalCase()}}Command {
  id: string;
}

@Injectable()
export class Delete{{name.pascalCase()}}Usecase {
  constructor(
    @Inject({{name.constantCase()}}_REPOSITORY)
    private readonly {{name.camelCase()}}Repository: {{name.pascalCase()}}Repository,
  ) {}

  async execute(command: Delete{{name.pascalCase()}}Command) {
    const instance = await this.{{name.camelCase()}}Repository.findOne(command.id);

    if (!instance) {
      throw new RessourceDoesNotExist();
    }

    return this.{{name.camelCase()}}Repository.remove(command.id);
  }
}
