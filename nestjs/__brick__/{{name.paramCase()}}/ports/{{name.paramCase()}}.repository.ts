import { {{name.pascalCase()}} } from '../models/{{name.paramCase()}}.model';

export const {{name.constantCase()}}_REPOSITORY = '{{name.paramCase()}}.repository';

export interface {{name.pascalCase()}}Repository {
  create({{name.camelCase()}}: {{name.pascalCase()}}): Promise<{{name.pascalCase()}}>;

  findAll(): Promise<{{name.pascalCase()}}[]>;

  findOne(id: string): Promise<{{name.pascalCase()}} | null>;

  update(id: string, name: string): Promise<void>;

  remove(id: string): Promise<void>;
}
