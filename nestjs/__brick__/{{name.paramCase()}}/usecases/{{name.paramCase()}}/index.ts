import { Inject, Injectable } from '@nestjs/common';
import { RessourceAlreadyExists, RessourceDoesNotExist } from '@app/common';
import {
  {{name.constantCase()}}_REPOSITORY,
  {{name.pascalCase()}}Repository,
} from '../../ports/{{name.paramCase()}}.repository';

export class Create{{name.pascalCase()}}Command {
  id: string;
  name: string;
}

export class Update{{name.pascalCase()}}Command {
  id: string;
  name: string;
}

export class Delete{{name.pascalCase()}}Command {
  id: string;
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
