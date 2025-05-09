import { Inject, Injectable } from '@nestjs/common';
import { RessourceAlreadyExists } from '@app/common';
import { {{name.constantCase()}}_REPOSITORY, {{name.pascalCase()}}Repository } from '../../ports/{{name.paramCase()}}.repository';

export class Create{{name.pascalCase()}}Command {
  id: string;
  name: string;
}

@Injectable()
export class Create{{name.pascalCase()}}Usecase {
  constructor(
    @Inject({{name.constantCase()}}_REPOSITORY)
    private readonly {{name.camelCase()}}Repository: {{name.pascalCase()}}Repository,
  ) {}

  async execute(command: Create{{name.pascalCase()}}Command) {
    const instance = await this.{{name.camelCase()}}Repository.findOne(command.id);

    if (instance) {
      throw new RessourceAlreadyExists();
    }

    return this.{{name.camelCase()}}Repository.create(command);
  }
}
